"""Non-bâti tax calculator — translated from EFITA3N3.cob (763 lines COBOL, year 2023).

Computes cotisations, frais, CAAA, chambre d'agriculture,
and dégrévement jeunes agriculteurs for non-built property.
"""
from decimal import Decimal
from models import (
    InputNonBati, ResultNonBati,
    RatesIFP, RatesDirection, RatesCommune,
)
from rounding import cobol_round, compute_cotisation

F300_TOTAL = Decimal("0.0300")
F300_ASSIETTE = Decimal("0.0100")
F800_TOTAL = Decimal("0.0800")
F800_ASSIETTE = Decimal("0.0440")
F900_TOTAL = Decimal("0.0900")
F900_ASSIETTE = Decimal("0.0540")
FCAAA_TOTAL = Decimal("0.0781")
FCAAA_ASSIETTE = Decimal("0.0458")

DFIXCAAA_POS = 2
DFIXCAAA_NEG = -2
LIMBASCAAA_POS = 8
LIMBASCAAA_NEG = -8


def calculate_non_bati(
    inp: InputNonBati,
    rates_ifp: RatesIFP,
    rates_dir: RatesDirection,
    rates_com: RatesCommune,
) -> tuple[ResultNonBati, int, int]:
    """
    Returns (result, cr, rc).
    cr=0 → success. cr=12 → validation error.
    """
    result = ResultNonBati()
    cr, rc = 0, 0

    # --- VALIDATION (lines 140-176) ---
    if inp.ccobnb != "1":
        cr, rc = 12, 1
    if inp.dan != "2023":
        cr, rc = 12, 2

    int_fields = [
        inp.mbacom, inp.mbadep, inp.mbasyn, inp.mbacu,
        inp.mbage3, inp.mbnt13[0], inp.mbnt13[1],
        inp.mbaca, inp.mbacaa,
        inp.mbjcom, inp.mbjsyn, inp.mbjcu,
        inp.mbjt13[0], inp.mbjt13[1], inp.mbjdep,
        inp.mb1pre, inp.mbjpre,
        inp.mbjeco, inp.mbjesy, inp.mbjeic,
    ]
    for b in int_fields:
        if not isinstance(b, int):
            cr, rc = 12, 11
            break

    if cr > 0:
        return result, cr, rc

    # --- RATE MAPPING (lines 292-329) ---
    taux_com = rates_ifp.taucom_nb
    taux_syn = rates_ifp.tausyndsfp_nb
    taux_cu = rates_ifp.taucudfpvn_nb
    taux_gem = rates_ifp.pnbgem
    taux_tse1 = rates_ifp.tautse_nb
    taux_tse2 = rates_ifp.pnbtgp
    taux_txadd = rates_ifp.pnbtxa
    taux_chagr = rates_dir.tauchagr_nb
    taux_caaa = rates_ifp.pnbcaa
    taux_smagr = rates_dir.tausmagr_nb

    # ============================================================
    # POSTE 1: IMPOSITION NON BÂTIE (lines 376-413)
    # ============================================================
    cotis_com = compute_cotisation(inp.mbacom, taux_com)
    cotis_dep = compute_cotisation(inp.mbadep, taux_txadd)  # taxe additionnelle
    cotis_syn = compute_cotisation(inp.mbasyn, taux_syn)
    cotis_cu = compute_cotisation(inp.mbacu, taux_cu)
    cotis_gem = compute_cotisation(inp.mbage3, taux_gem)
    cotis_tse1 = compute_cotisation(inp.mbnt13[0], taux_tse1)
    cotis_tse2 = compute_cotisation(inp.mbnt13[1], taux_tse2)
    cotis_tse_amalg = cobol_round(cotis_tse1 + cotis_tse2)

    # Chambre consulaire Saint-Martin
    cotis_smagr = compute_cotisation(inp.mbaca, taux_smagr)

    # Chambre d'agriculture
    cotis_agr = compute_cotisation(inp.mbaca, taux_chagr)

    # --- CAAA (lines 420-443) ---
    dfixcaa = 0
    ccodep = inp.cc2dep
    if ccodep == "57":
        if inp.mbacaa > 0:
            if inp.mbacaa >= LIMBASCAAA_POS:
                dfixcaa = DFIXCAAA_POS
        if inp.mbacaa < 0:
            if inp.mbacaa <= LIMBASCAAA_NEG:
                dfixcaa = DFIXCAAA_NEG

    dprocaa = 0
    if taux_caaa != 0:
        dprocaa = compute_cotisation(inp.mbacaa, taux_caaa)

    # --- FRAIS POSTE 1 (lines 451-525) ---
    totcot3 = cotis_com + cotis_cu + cotis_dep + cotis_gem
    totcot8 = cotis_syn + cotis_agr
    totcot9 = cotis_tse1 + cotis_tse2

    fa300 = cobol_round(Decimal(totcot3) * F300_ASSIETTE)
    frais3 = cobol_round(Decimal(totcot3) * F300_TOTAL)
    fn300 = frais3 - fa300

    fa800 = cobol_round(Decimal(totcot8) * F800_ASSIETTE)
    frais8 = cobol_round(Decimal(totcot8) * F800_TOTAL)
    fn800 = frais8 - fa800

    fa900 = cobol_round(Decimal(totcot9) * F900_ASSIETTE)
    frais9 = cobol_round(Decimal(totcot9) * F900_TOTAL)
    fn900 = frais9 - fa900

    if fa800 < fn800:
        fa800 += 1
        fn800 -= 1
    if fa900 < fn900:
        fa900 += 1
        fn900 -= 1

    # Frais CAAA (lines 518-525)
    farc = cobol_round(Decimal(dprocaa) * FCAAA_ASSIETTE)
    frais_caaa = cobol_round(Decimal(dprocaa) * FCAAA_TOTAL)
    frnvc = frais_caaa - farc

    # ============================================================
    # POSTE 4: DÉGRÉVEMENT JEUNES AGRICULTEURS (lines 539-645)
    # ============================================================
    ja_active = any([
        inp.mbjcom, inp.mbjsyn, inp.mbjcu,
        inp.mbjeco, inp.mbjesy, inp.mbjeic,
    ])

    dja_com = 0
    dja_syn = 0
    dja_cu = 0
    dja_eco = 0
    dja_esy = 0
    dja_eic = 0
    dja_etat = 0
    dja_frais_a = 0
    dja_frais_nv = 0

    if ja_active:
        # Part collectivités (lines 591-600)
        dja_com = compute_cotisation(inp.mbjcom, taux_com)
        dja_syn = compute_cotisation(inp.mbjsyn, taux_syn)
        dja_cu = compute_cotisation(inp.mbjcu, taux_cu)

        # Part état (lines 603-612)
        dja_eco = compute_cotisation(inp.mbjeco, taux_com)
        dja_esy = compute_cotisation(inp.mbjesy, taux_syn)
        dja_eic = compute_cotisation(inp.mbjeic, taux_cu)
        dja_etat = dja_eco + dja_esy + dja_eic

        # Frais JA (lines 625-644)
        ja_totcot3 = dja_com + dja_cu + dja_eco + dja_eic
        ja_totcot8 = dja_syn + dja_esy

        dja_frais_a = cobol_round(
            Decimal(ja_totcot3) * F300_ASSIETTE
            + Decimal(ja_totcot8) * F800_ASSIETTE
        )
        ja_frais_total = cobol_round(
            Decimal(ja_totcot3) * F300_TOTAL
            + Decimal(ja_totcot8) * F800_TOTAL
        )
        dja_frais_nv = cobol_round(ja_frais_total - dja_frais_a)

    # ============================================================
    # AGGREGATED RESULTS (lines 650-758)
    # ============================================================

    # Saint-Martin special case (lines 720-723)
    if inp.ac3dir == "971" and inp.ccocom == "127":
        totcot3 += cotis_smagr

    # Cotis brute (lines 726-730)
    cotis_brute = totcot3 + totcot8 + totcot9 + dprocaa + dfixcaa

    # Total degvt JA with frais (lines 733-738)
    cotdegja = dja_com + dja_syn + dja_cu + dja_etat + dja_frais_a + dja_frais_nv

    # --- FILL RESULT ---
    result.mctcom = cotis_com
    result.mctdep = cotis_dep
    result.mctsyn = cotis_syn
    result.mctcu = cotis_cu
    result.mcoge3 = cotis_gem
    result.mcnt13 = [cotis_tse1, cotis_tse2]
    result.mcntsa = cotis_tse_amalg
    result.mctca = cotis_agr
    result.mctcas = cotis_smagr
    result.mctcap = dprocaa
    result.mctcad = dfixcaa
    result.mfa300 = fa300
    result.mfn300 = fn300
    result.mcfaca = farc
    result.mcfnvc = frnvc
    result.mfa800 = fa800
    result.mfn800 = fn800
    result.mfa900 = fa900
    result.mfn900 = fn900
    result.mdjcom = dja_com
    result.mdjsyn = dja_syn
    result.mdjcu = dja_cu
    result.mcnjae = dja_etat
    result.mfaj1e = dja_frais_a
    result.mfnj1e = dja_frais_nv

    result.tcthfr = cobol_round(cotis_brute - cotdegja)
    result.tctfra = (fa300 + fn300 + farc + frnvc + fa800 + fn800 + fa900 + fn900)
    result.tctdu = cotis_brute + result.tctfra - cotdegja

    return result, 0, 0
