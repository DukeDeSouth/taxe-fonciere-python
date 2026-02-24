"""COBOL-compatible rounding for COMPUTE ROUNDED (TRAP-02).

All monetary values in taxe foncière are integers (PIC S9(10)).
Tax rates have 6 decimal places (PIC S9(4)V9(6)).
COMPUTE ROUNDED → ROUND_HALF_UP to nearest integer.
"""
from decimal import Decimal, ROUND_HALF_UP, getcontext

getcontext().prec = 28

ONE = Decimal("1")


def cobol_round(value) -> int:
    """COBOL COMPUTE ROUNDED to integer (PIC S9(10))."""
    return int(Decimal(str(value)).quantize(ONE, rounding=ROUND_HALF_UP))


def compute_cotisation(base: int, taux) -> int:
    """cotisation = base * taux / 100, ROUNDED."""
    return cobol_round(Decimal(str(base)) * Decimal(str(taux)) / Decimal("100"))
