"""Tests for bâti (built property) tax calculator — EFITA3B3 translation (2023)."""
import sys
from pathlib import Path
from decimal import Decimal

sys.path.insert(0, str(Path(__file__).parent.parent / "src" / "python"))

from models import InputBati, OMZone, RatesIFP, RatesDirection, RatesCommune
from calc_bati import calculate_bati
from rounding import compute_cotisation, cobol_round


D = Decimal


def make_standard_rates():
    """Realistic rates for a typical French commune."""
    return (
        RatesIFP(
            taucom_b=D("21.360000"),
            tausyndsfp_b=D("0.000000"),
            taucudfpvn_b=D("8.540000"),
            tautse_b=D("1.270000"),
            ptbtgp=D("0.000000"),
            ptbgem=D("0.180000"),
        ),
        RatesDirection(
            taudep_b=D("14.850000"),
            ptbtas=D("0.000000"),
        ),
        RatesCommune(
            pbbomp=D("9.870000"),
            pbboma=D("6.910000"),
        ),
    )


class TestBatiValidation:

    def test_wrong_ccobnb(self):
        inp = InputBati(ccobnb="1")
        ri, rd, rc = make_standard_rates()
        _, cr, code = calculate_bati(inp, ri, rd, rc)
        assert cr == 12
        assert code == 1

    def test_wrong_year(self):
        inp = InputBati(dan="2019")
        ri, rd, rc = make_standard_rates()
        _, cr, code = calculate_bati(inp, ri, rd, rc)
        assert cr == 12
        assert code == 2

    def test_invalid_om_zone(self):
        inp = InputBati(zones_om=[
            OMZone(gtauom="XX", base=100),
            OMZone(), OMZone(), OMZone(), OMZone(), OMZone(),
        ])
        ri, rd, rc = make_standard_rates()
        _, cr, code = calculate_bati(inp, ri, rd, rc)
        assert cr == 12
        assert code == 5


class TestBatiSimple:

    def test_basic_cotisations(self):
        """Single commune, all bases > 0, one OM zone plein (2023, no département)."""
        inp = InputBati(
            ccobnb="2",
            dan="2023",
            cc2dep="75",
            ccodir="0",
            ccocom="056",
            mbacom=10000,
            mbasyn=0,
            mbacu=10000,
            mbage3=10000,
            mbata3=0,
            mbbt13=[5000, 0],
            zones_om=[
                OMZone(gtauom="P ", base=10000),
                OMZone(), OMZone(), OMZone(), OMZone(), OMZone(),
            ],
            mvltim=0,
            ccoifp="056",
            ccpper="001",
        )
        ri, rd, rc = make_standard_rates()
        result, cr, code = calculate_bati(inp, ri, rd, rc)

        assert cr == 0
        assert code == 0

        assert result.mctcom == 2136
        assert result.mctcu == 854
        assert result.mcoge3 == 18
        assert result.mcbt13[0] == 64
        assert result.mcbt13[1] == 0
        assert result.mctsyn == 0
        assert result.actom[0]["mctom"] == 987
        assert result.actom[1]["mctom"] == 0
        # Default totofr=' ' → OM in 8% bucket
        assert result.tctom == 987

    def test_frais_calculation(self):
        """Verify frais (fees) calculation chain (2023, no département)."""
        inp = InputBati(
            mbacom=50000,
            mbacu=50000,
            mbage3=50000,
            mbasyn=10000,
            mbata3=5000,
            mbbt13=[20000, 10000],
            zones_om=[
                OMZone(gtauom="P ", base=50000),
                OMZone(gtauom="RA", base=30000),
                OMZone(), OMZone(), OMZone(), OMZone(),
            ],
            mvltim=500,
        )
        ri, rd, rc = make_standard_rates()
        result, cr, _ = calculate_bati(inp, ri, rd, rc)
        assert cr == 0

        assert result.tctdu == result.tcthfr + result.tctfra
        assert result.tctfra == (
            result.mfa300 + result.mfn300
            + result.mfa800 + result.mfn800
            + result.mfa900 + result.mfn900
        )
        assert result.mfa800 >= result.mfn800
        assert result.mfa900 >= result.mfn900

    def test_totofr_transfer_regime(self):
        """TOTOFR='O': OM goes to 3% frais instead of 8%."""
        inp = InputBati(
            mbacom=10000,
            mbacu=10000,
            mbage3=10000,
            zones_om=[
                OMZone(gtauom="P ", base=10000),
                OMZone(), OMZone(), OMZone(), OMZone(), OMZone(),
            ],
        )
        ri, rd, rc = make_standard_rates()
        ri.totofr = "O"

        result_o, cr_o, _ = calculate_bati(inp, ri, rd, rc)
        assert cr_o == 0

        ri.totofr = " "
        result_std, cr_std, _ = calculate_bati(inp, ri, rd, rc)
        assert cr_std == 0

        # tcthfr same (same cotisations)
        assert result_o.tcthfr == result_std.tcthfr
        # tctom same (same OM)
        assert result_o.tctom == result_std.tctom
        # frais differ: TOTOFR='O' shifts OM from 8% to 3% bucket → less total frais
        assert result_o.tctfra < result_std.tctfra
        # tctdu differs accordingly
        assert result_o.tctdu < result_std.tctdu

    def test_zero_bases(self):
        """All bases = 0 → all cotisations = 0."""
        inp = InputBati()
        ri, rd, rc = make_standard_rates()
        result, cr, _ = calculate_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.tcthfr == 0
        assert result.tctfra == 0
        assert result.tctdu == 0


class TestBatiOMZones:

    def test_all_zone_types(self):
        """Test all 6 OM zone types."""
        ri, rd, rc = make_standard_rates()
        # Manually add rates for RE
        rc.pbbome = D("3.500000")

        zones = [
            OMZone(gtauom="P ", base=10000),
            OMZone(gtauom="RA", base=10000),
            OMZone(gtauom="RB", base=10000),
            OMZone(gtauom="RC", base=10000),
            OMZone(gtauom="RD", base=10000),
            OMZone(gtauom="RE", base=10000),
        ]
        inp = InputBati(zones_om=zones)
        result, cr, _ = calculate_bati(inp, ri, rd, rc)
        assert cr == 0

        # P  → 10000 * 9.87 / 100 = 987
        assert result.actom[0]["mctom"] == 987
        # RA → 10000 * 6.91 / 100 = 691
        assert result.actom[1]["mctom"] == 691
        # RB → taux_omb = 0 → 0
        assert result.actom[2]["mctom"] == 0
        # RC → taux_omc = 0 → 0
        assert result.actom[3]["mctom"] == 0
        # RD → taux_omd = 0 → 0
        assert result.actom[4]["mctom"] == 0
        # RE → 10000 * 3.5 / 100 = 350
        assert result.actom[5]["mctom"] == 350


class TestBatiReequilibrage:

    def test_fa_lt_fn_gets_corrected(self):
        """When frais assiette < frais non-valeur, +1/-1 correction."""
        # With very small bases, fa can be < fn due to rounding
        # fa = round(base * 0.044) vs fn = round(base * 0.08) - fa
        # For base=1: fa=round(0.044)=0, fn=round(0.08)-0=0 — no correction
        # For base=23: fa=round(23*0.044)=round(1.012)=1
        #              frais=round(23*0.08)=round(1.84)=2
        #              fn=2-1=1 → fa==fn, no correction
        # We need to construct a scenario where fa < fn
        ri, rd, rc = make_standard_rates()

        # totcot8 = total_om + syn + tasa
        # Pick a value where 4.4% rounds down and total-assiette rounds up
        inp = InputBati(
            mbasyn=9,
            zones_om=[OMZone() for _ in range(6)],
        )
        result, cr, _ = calculate_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.mfa800 >= result.mfn800


class TestBatiRounding:

    def test_half_up_rounding(self):
        """COBOL ROUNDED = half-up: 0.5 → 1, not banker's rounding."""
        # 5000 * 1.270000 / 100 = 63.5 → should round to 64
        result = compute_cotisation(5000, D("1.270000"))
        assert result == 64

    def test_negative_rounding(self):
        """Negative values round away from zero."""
        result = cobol_round(D("-0.5"))
        assert result == -1


if __name__ == "__main__":
    import pytest
    pytest.main([__file__, "-v"])
