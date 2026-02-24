"""Tests for non-bâti (non-built property) tax calculator — EFITA3N3 translation (2023)."""
import sys
from pathlib import Path
from decimal import Decimal

sys.path.insert(0, str(Path(__file__).parent.parent / "src" / "python"))

from models import InputNonBati, RatesIFP, RatesDirection, RatesCommune
from calc_non_bati import calculate_non_bati
from rounding import compute_cotisation

D = Decimal


def make_nb_rates():
    """Realistic non-bâti rates."""
    return (
        RatesIFP(
            taucom_nb=D("45.120000"),
            tausyndsfp_nb=D("0.000000"),
            taucudfpvn_nb=D("18.230000"),
            tautse_nb=D("2.540000"),
            pnbtgp=D("0.000000"),
            pnbgem=D("0.360000"),
            pnbtxa=D("32.680000"),
            pnbcaa=D("7.450000"),
        ),
        RatesDirection(
            tauchagr_nb=D("11.240000"),
            tausmagr_nb=D("0.000000"),
        ),
        RatesCommune(),
    )


class TestNonBatiValidation:

    def test_wrong_ccobnb(self):
        inp = InputNonBati(ccobnb="2")
        ri, rd, rc = make_nb_rates()
        _, cr, code = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 12 and code == 1

    def test_wrong_year(self):
        inp = InputNonBati(dan="2020")
        ri, rd, rc = make_nb_rates()
        _, cr, code = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 12 and code == 2


class TestNonBatiSimple:

    def test_basic_cotisations(self):
        """Basic non-bâti: commune + taxe additionnelle + EPCI."""
        inp = InputNonBati(
            cc2dep="33",
            ccodir="0",
            ccocom="063",
            mbacom=5000,
            mbadep=5000,    # base taxe additionnelle
            mbasyn=0,
            mbacu=5000,
            mbage3=5000,
            mbnt13=[2000, 0],
            mbaca=3000,     # base chambre agriculture
            mbacaa=0,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0

        # cotis_com = 5000 * 45.12 / 100 = 2256
        assert result.mctcom == 2256
        # cotis_dep (taxe add) = 5000 * 32.68 / 100 = 1634
        assert result.mctdep == 1634
        # cotis_cu = 5000 * 18.23 / 100 = 911.5 → 912
        assert result.mctcu == 912
        # cotis_gem = 5000 * 0.36 / 100 = 18
        assert result.mcoge3 == 18
        # cotis_tse1 = 2000 * 2.54 / 100 = 50.8 → 51
        assert result.mcnt13[0] == 51
        # chambre agr = 3000 * 11.24 / 100 = 337.2 → 337
        assert result.mctca == 337

        assert result.tctdu == result.tcthfr + result.tctfra

    def test_zero_bases(self):
        inp = InputNonBati()
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.tcthfr == 0
        assert result.tctdu == 0


class TestCAAADept57:

    def test_droit_fixe_positive_above_threshold(self):
        """Dept 57, base CAAA >= 8 → droit fixe = +2."""
        inp = InputNonBati(
            cc2dep="57",
            ccodir="0",
            ccocom="001",
            mbacaa=10,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.mctcad == 2

    def test_droit_fixe_positive_below_threshold(self):
        """Dept 57, base CAAA > 0 but < 8 → droit fixe = 0."""
        inp = InputNonBati(
            cc2dep="57",
            ccodir="0",
            ccocom="001",
            mbacaa=5,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.mctcad == 0

    def test_droit_fixe_negative_below_threshold(self):
        """Dept 57, base CAAA <= -8 → droit fixe = -2."""
        inp = InputNonBati(
            cc2dep="57",
            ccodir="0",
            ccocom="001",
            mbacaa=-10,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.mctcad == -2

    def test_droit_fixe_other_dept(self):
        """Non dept 57 → droit fixe = 0 regardless of base."""
        inp = InputNonBati(
            cc2dep="33",
            ccodir="0",
            ccocom="001",
            mbacaa=100,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.mctcad == 0

    def test_droit_proportionnel_caaa(self):
        """CAAA proportional tax with frais."""
        inp = InputNonBati(
            cc2dep="33",
            ccodir="0",
            ccocom="001",
            mbacaa=1000,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        # dprocaa = 1000 * 7.45 / 100 = 74.5 → 75
        assert result.mctcap == 75
        # farc = 75 * 0.0458 = 3.435 → 3
        assert result.mcfaca == 3
        # frais_total = 75 * 0.0781 = 5.8575 → 6
        # frnvc = 6 - 3 = 3
        assert result.mcfnvc == 3


class TestSaintMartin:

    def test_cotis_smagr_added_to_totcot3(self):
        """Saint-Martin (971/127): chambre consulaire added to totcot3."""
        inp = InputNonBati(
            cc2dep="97",
            ccodir="1",
            ccocom="127",
            mbacom=10000,
            mbaca=5000,
        )
        ri, rd, rc = make_nb_rates()
        rd.tausmagr_nb = D("2.500000")
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        # cotis_smagr = 5000 * 2.5 / 100 = 125
        assert result.mctcas == 125
        # totcot3 includes cotis_smagr for Saint-Martin
        # This affects tcthfr and tctdu


class TestJeunesAgriculteurs:

    def test_degvt_ja_collectivites(self):
        """Dégrévement JA — part collectivités."""
        inp = InputNonBati(
            cc2dep="33",
            ccodir="0",
            ccocom="063",
            mbacom=5000,
            mbjcom=1000,    # base JA commune
            mbjsyn=0,
            mbjcu=500,      # base JA EPCI
            mbjeco=200,     # base JA état commune
            mbjesy=0,
            mbjeic=100,     # base JA état EPCI
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0

        # dja_com = 1000 * 45.12 / 100 = 451.2 → 451
        assert result.mdjcom == 451
        # dja_cu = 500 * 18.23 / 100 = 91.15 → 91
        assert result.mdjcu == 91
        # dja_eco = 200 * 45.12 / 100 = 90.24 → 90
        # dja_eic = 100 * 18.23 / 100 = 18.23 → 18
        # dja_etat = 90 + 0 + 18 = 108
        assert result.mcnjae == 108

        # degvt reduces tcthfr
        assert result.tcthfr < result.mctcom + result.mctcu

    def test_no_ja(self):
        """No JA bases → no dégrévement."""
        inp = InputNonBati(mbacom=5000)
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.mdjcom == 0
        assert result.mcnjae == 0
        assert result.mfaj1e == 0


class TestNonBatiConsistency:

    def test_tctdu_equals_tcthfr_plus_tctfra(self):
        """total dû = cotis brute + frais - degvt JA."""
        inp = InputNonBati(
            cc2dep="33",
            ccodir="0",
            ccocom="063",
            mbacom=20000,
            mbadep=15000,
            mbacu=20000,
            mbage3=20000,
            mbnt13=[10000, 5000],
            mbaca=8000,
            mbacaa=3000,
        )
        ri, rd, rc = make_nb_rates()
        result, cr, _ = calculate_non_bati(inp, ri, rd, rc)
        assert cr == 0
        assert result.tctdu == result.tcthfr + result.tctfra
        assert result.tctfra == (
            result.mfa300 + result.mfn300
            + result.mcfaca + result.mcfnvc
            + result.mfa800 + result.mfn800
            + result.mfa900 + result.mfn900
        )


if __name__ == "__main__":
    import pytest
    pytest.main([__file__, "-v"])
