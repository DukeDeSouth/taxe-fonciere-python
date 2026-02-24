"""Bâti tax calculator — translated from EFITA3B3.cob (543 lines COBOL, year 2023).

Computes cotisations (taxes), ordures ménagères (waste collection),
and frais de gestion (management fees) for built property.

Changes vs 2018:
  - Département tax removed (reform 2020)
  - OM frais split by TOTOFR flag (TEOM transfer regime)
  - Validation: mbadep removed from numeric check
"""
from decimal import Decimal
from models import InputBati, ResultBati, RatesIFP, RatesDirection, RatesCommune
from rounding import cobol_round, compute_cotisation

VALID_GTAUOM = {"  ", "P ", " P", "RA", "RB", "RC", "RD", "RE"}

F300_TOTAL = Decimal("0.0300")
F300_ASSIETTE = Decimal("0.0100")
F800_TOTAL = Decimal("0.0800")
F800_ASSIETTE = Decimal("0.0440")
F900_TOTAL = Decimal("0.0900")
F900_ASSIETTE = Decimal("0.0540")


def calculate_bati(
    inp: InputBati,
    rates_ifp: RatesIFP,
    rates_dir: RatesDirection,
    rates_com: RatesCommune,
) -> tuple[ResultBati, int, int]:
    """
    Returns (result, cr, rc).
    cr=0, rc=0 means success.
    cr=12 means validation error, rc indicates which check failed.
    """
    result = ResultBati()
    cr, rc = 0, 0

    # --- VALIDATION (lines 120-157 of EFITA3B3) ---
    if inp.ccobnb != "2":
        cr, rc = 12, 1

    if inp.dan != "2023":
        cr, rc = 12, 2

    bases_to_check = [
        inp.mbacom, inp.mbasyn, inp.mbacu,
        inp.mbage3, inp.mbata3, inp.mbbt13[0], inp.mbbt13[1],
    ]
    for b in bases_to_check:
        if not isinstance(b, int):
            cr, rc = 12, 11
            break

    for i, zone in enumerate(inp.zones_om):
        if zone.gtauom not in VALID_GTAUOM:
            cr, rc = 12, 5
        if zone.gtauom.strip() and not isinstance(zone.base, int):
            cr, rc = 12, 6
        if zone.gtauom == "  ":
            inp.zones_om[i] = type(zone)(gtauom="  ", base=0)

    if cr > 0:
        return result, cr, rc

    # --- RATE MAPPING (lines 250-291) ---
    taux_com = rates_ifp.taucom_b
    # taux_dep removed in 2023 (département supprimé)
    taux_syn = rates_ifp.tausyndsfp_b
    taux_cu = rates_ifp.taucudfpvn_b
    taux_gem = rates_ifp.ptbgem
    taux_tas = rates_dir.ptbtas
    taux_tse1 = rates_ifp.tautse_b
    taux_tse2 = rates_ifp.ptbtgp

    taux_om = [
        rates_com.pbbomp,   # P / ' P' → index 0
        rates_com.pbboma,   # RA → index 1
        rates_com.pbbomb,   # RB → index 2
        rates_com.pbbomc,   # RC → index 3
        rates_com.pbbomd,   # RD → index 4
        rates_com.pbbome,   # RE → index 5
    ]

    GTAUOM_TO_RATE_IDX = {
        "P ": 0, " P": 0, "RA": 1, "RB": 2, "RC": 3, "RD": 4, "RE": 5,
    }

    # --- COTISATIONS (lines 333-359) ---
    cotis_com = compute_cotisation(inp.mbacom, taux_com)
    # cotis_dep removed in 2023
    cotis_syn = compute_cotisation(inp.mbasyn, taux_syn)
    cotis_cu = compute_cotisation(inp.mbacu, taux_cu)
    cotis_gem = compute_cotisation(inp.mbage3, taux_gem)
    cotis_tas = compute_cotisation(inp.mbata3, taux_tas)
    cotis_tse1 = compute_cotisation(inp.mbbt13[0], taux_tse1)
    cotis_tse2 = compute_cotisation(inp.mbbt13[1], taux_tse2)
    cotis_tse_amalg = cobol_round(cotis_tse1 + cotis_tse2 + cotis_tas)

    # --- ORDURES MÉNAGÈRES (lines 355-391) ---
    cotis_om = [0] * 6
    for i, zone in enumerate(inp.zones_om):
        gt = zone.gtauom
        if gt == "  ":
            cotis_om[i] = 0
        elif gt in GTAUOM_TO_RATE_IDX:
            idx = GTAUOM_TO_RATE_IDX[gt]
            cotis_om[i] = compute_cotisation(zone.base, taux_om[idx])

    cotis_omi = inp.mvltim  # TEOMI passed through directly

    # --- OM / TOTOFR SPLIT (EFITA3B3 lines 406-431) ---
    totofr = rates_ifp.totofr
    total_om = sum(cotis_om) + cotis_omi

    if totofr == "O":
        totcotom3 = total_om
        totcotom8 = 0
    else:
        totcotom3 = 0
        totcotom8 = total_om

    totcot3 = cotis_com + cotis_cu + cotis_gem + totcotom3
    totcot8 = totcotom8 + cotis_syn + cotis_tas
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

    # Rééquilibrage: frais assiette >= frais non-valeur (lines 432-439)
    if fa800 < fn800:
        fa800 += 1
        fn800 -= 1
    if fa900 < fn900:
        fa900 += 1
        fn900 -= 1

    # --- FILL RESULT (EFITA3B3 lines 466-529) ---
    result.mctcom = cotis_com
    result.mctsyn = cotis_syn
    result.mctcu = cotis_cu
    result.mcoge3 = cotis_gem
    result.mcota3 = cotis_tas
    result.mcbt13 = [cotis_tse1, cotis_tse2]
    result.mcbtsa = cotis_tse_amalg
    result.mvltim = cotis_omi

    for i in range(6):
        result.actom[i] = {
            "gtauom": inp.zones_om[i].gtauom,
            "mctom": cotis_om[i],
        }

    result.tctom = totcotom3 if totofr == "O" else totcotom8

    result.tcthfr = totcot3 + totcot8 + totcot9
    result.mfa300 = fa300
    result.mfn300 = fn300
    result.mfa800 = fa800
    result.mfn800 = fn800
    result.mfa900 = fa900
    result.mfn900 = fn900
    result.tctfra = fa300 + fn300 + fa800 + fn800 + fa900 + fn900
    result.tctdu = result.tcthfr + result.tctfra

    return result, 0, 0
