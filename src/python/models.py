"""Data structures translated from COBOL copybooks (TRAP-47, TRAP-51).

Year 2023 — aligned with EFITA3B3/EFITA3N3.

XCOMBAT  → InputBati        (input for built property)
XCOMNBA  → InputNonBati     (input for non-built property)
XRETB    → ResultBati       (output for bâti)
XRETNB   → ResultNonBati    (output for non-bâti)
XBXTDSR  → RatesIFP         (rates at IFP/trésorerie level)
XBXTDDIR → RatesDirection   (rates at direction level)
XBXTDCOM → RatesCommune     (rates at commune level)
"""
from dataclasses import dataclass, field
from decimal import Decimal

ZERO = Decimal("0")


@dataclass
class OMZone:
    """One of 6 possible ordures ménagères zones (bâti only)."""
    gtauom: str = "  "      # zone type: '  ', 'P ', ' P', 'RA'..'RE'
    base: int = 0            # base OM for this zone


@dataclass
class InputBati:
    """From XCOMBAT — input for EFITA3B3 (bâti calculator, 2023)."""
    ccobnb: str = "2"        # must be '2' for bâti
    dan: str = "2023"        # année d'imposition
    cc2dep: str = ""          # code département (2 chars)
    ccodir: str = ""          # code direction (1 char)
    ccocom: str = ""          # code commune (3 chars)
    dsrpar: str = ""          # série rôle parcelle
    cgroup: str = ""          # code groupe propriétaire
    nnupro: int = 0           # numéro compte propriétaire
    mbacom: int = 0           # base communale
    mbadep: int = 0           # base départementale
    mbasyn: int = 0           # base syndicat
    mbacu: int = 0            # base EPCI
    mbage3: int = 0           # base GEMAPI
    mbata3: int = 0           # base TASA
    mbbt13: list[int] = field(default_factory=lambda: [0, 0])  # bases TSE [1, 2]
    zones_om: list[OMZone] = field(
        default_factory=lambda: [OMZone() for _ in range(6)]
    )
    mvltim: int = 0           # montant TEOMI
    ccoifp: str = ""          # code IFP (3 chars)
    ccpper: str = ""          # code trésorerie (3 chars)

    @property
    def ac3dir(self) -> str:
        return self.cc2dep + self.ccodir


@dataclass
class InputNonBati:
    """From XCOMNBA — input for EFITA3N3 (non-bâti calculator, 2023)."""
    ccobnb: str = "1"        # must be '1' for non-bâti
    dan: str = "2023"
    cc2dep: str = ""
    ccodir: str = ""
    ccocom: str = ""
    dsrpar: str = ""
    cgroup: str = ""
    nnupro: int = 0
    mbacom: int = 0           # base communale
    mbadep: int = 0           # base taxe additionnelle
    mbasyn: int = 0           # base syndicat
    mbacu: int = 0            # base EPCI
    mbage3: int = 0           # base GEMAPI
    mbnt13: list[int] = field(default_factory=lambda: [0, 0])  # bases TSE
    mbaca: int = 0            # base chambre d'agriculture
    mbacaa: int = 0           # base CAAA
    mbapos: int = 0           # base majoration terrain constructible
    # Jeunes agriculteurs — bases collectivités
    mbjcom: int = 0           # base JA commune
    mbjsyn: int = 0           # base JA syndicat
    mbjcu: int = 0            # base JA EPCI
    mbjtse: int = 0           # base JA TSE
    mbjt13: list[int] = field(default_factory=lambda: [0, 0])
    mbjdep: int = 0           # base JA département
    mb1pre: int = 0           # base départementale PRES
    mbjpre: int = 0           # base JA PRES
    # Jeunes agriculteurs — bases état
    mbjeco: int = 0           # base JA état commune
    mbjesy: int = 0           # base JA état syndicat
    mbjeic: int = 0           # base JA état EPCI
    ccoifp: str = ""
    ccpper: str = ""

    @property
    def ac3dir(self) -> str:
        return self.cc2dep + self.ccodir


@dataclass
class ResultBati:
    """From XRETB — output of EFITA3B3 (2023, département removed)."""
    mctcom: int = 0           # cotisation commune
    mctsyn: int = 0           # cotisation syndicat
    mctcu: int = 0            # cotisation EPCI
    mcoge3: int = 0           # cotisation GEMAPI
    mcota3: int = 0           # cotisation TASA
    mcbt13: list[int] = field(default_factory=lambda: [0, 0])  # TSE 1, 2
    mcbtsa: int = 0           # amalgame TSE1+TSE2+TASA
    mvltim: int = 0           # TEOMI
    actom: list[dict] = field(default_factory=lambda: [
        {"gtauom": "  ", "mctom": 0} for _ in range(6)
    ])
    tctom: int = 0            # total OM + TEOMI
    mfa300: int = 0           # frais assiette 3%
    mfn300: int = 0           # frais non-valeur 3%
    mfa800: int = 0           # frais assiette 8%
    mfn800: int = 0           # frais non-valeur 8%
    mfa900: int = 0           # frais assiette 9%
    mfn900: int = 0           # frais non-valeur 9%
    tcthfr: int = 0           # total cotis. hors frais
    tctfra: int = 0           # total frais
    tctdu: int = 0            # total dû


@dataclass
class ResultNonBati:
    """From XRETNB — output of EFITA3N3 (2023)."""
    mctcom: int = 0           # cotisation commune
    mctdep: int = 0           # cotisation taxe additionnelle
    mctsyn: int = 0           # cotisation syndicat
    mctcu: int = 0            # cotisation EPCI
    mcoge3: int = 0           # cotisation GEMAPI
    mcnt13: list[int] = field(default_factory=lambda: [0, 0])
    mcntsa: int = 0           # amalgame TSE1+TSE2
    mctca: int = 0            # cotisation chambre d'agriculture
    mctcas: int = 0           # cotisation chambre consulaire Saint-Martin
    mctcap: int = 0           # droit proportionnel CAAA
    mctcad: int = 0           # droit fixe CAAA
    mfa300: int = 0
    mfn300: int = 0
    mcfaca: int = 0           # frais assiette CAAA
    mcfnvc: int = 0           # frais non-valeur CAAA
    mfa800: int = 0
    mfn800: int = 0
    mfa900: int = 0
    mfn900: int = 0
    # Dégrévement jeunes agriculteurs
    mdjcom: int = 0
    mdjsyn: int = 0
    mdjcu: int = 0
    mcnjae: int = 0           # degvt JA état amalgamé
    mfaj1e: int = 0           # frais assiette JA état
    mfnj1e: int = 0           # frais non-valeur JA état
    tcthfr: int = 0
    tctfra: int = 0
    tctdu: int = 0


@dataclass
class RatesIFP:
    """From XBXTDSR — IFP/trésorerie level rates used by calculators."""
    taucom_b: Decimal = ZERO      # taux communal bâti
    tausyndsfp_b: Decimal = ZERO  # taux syndicat bâti
    taucudfpvn_b: Decimal = ZERO  # taux EPCI bâti
    tautse_b: Decimal = ZERO      # taux TSE 1 bâti
    ptbtgp: Decimal = ZERO        # taux TSE 2 bâti (Grand Paris)
    ptbgem: Decimal = ZERO        # taux GEMAPI bâti
    taucom_nb: Decimal = ZERO     # taux communal non-bâti
    tausyndsfp_nb: Decimal = ZERO
    taucudfpvn_nb: Decimal = ZERO
    tautse_nb: Decimal = ZERO     # taux TSE 1 non-bâti
    pnbtgp: Decimal = ZERO        # taux TSE 2 non-bâti
    pnbgem: Decimal = ZERO        # taux GEMAPI non-bâti
    pnbtxa: Decimal = ZERO        # taux taxe additionnelle non-bâti
    pnbcaa: Decimal = ZERO        # taux CAAA
    totofr: str = " "             # TAU-R-TOTOFR: 'O' = TEOM transfer regime (3% frais on OM)


@dataclass
class RatesDirection:
    """From XBXTDDIR — direction level rates."""
    taudep_b: Decimal = ZERO      # taux département bâti
    ptbtas: Decimal = ZERO        # taux TASA bâti
    tauchagr_nb: Decimal = ZERO   # taux chambre d'agriculture non-bâti
    tausmagr_nb: Decimal = ZERO   # taux chambre consulaire Saint-Martin


@dataclass
class RatesCommune:
    """From XBXTDCOM — commune level rates (OM rates)."""
    pbbomp: Decimal = ZERO        # taux OM plein
    pbboma: Decimal = ZERO        # taux OM réduit A
    pbbomb: Decimal = ZERO        # taux OM réduit B
    pbbomc: Decimal = ZERO        # taux OM réduit C
    pbbomd: Decimal = ZERO        # taux OM réduit D
    pbbome: Decimal = ZERO        # taux OM réduit E
