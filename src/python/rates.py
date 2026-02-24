"""Tax rate provider — replaces EFITAUX2 (INDEXED file) and FMSTAU2 (IMS DL/I).

EFITAUX2 reads TAUDIS (ORGANIZATION INDEXED) file with key:
  direction(3) + commune(3) + ccoifp(3) + ccpper(3)
and returns 7 × 400-byte segments (ZES).

In Python we mock this with a JSON file or in-memory dict.
"""
import json
from decimal import Decimal
from pathlib import Path
from models import RatesIFP, RatesDirection, RatesCommune


def _dec(value) -> Decimal:
    return Decimal(str(value))


class TaxRateProvider:
    """Provides tax rates for a given commune, replacing EFITAUX2/FMSTAU2."""

    def __init__(self, rates_file: str | Path | None = None):
        self._rates: dict = {}
        if rates_file:
            with open(rates_file) as f:
                self._rates = json.load(f)

    def add_rates(self, direction: str, commune: str, ifp: str,
                  rates_ifp: RatesIFP,
                  rates_dir: RatesDirection,
                  rates_com: RatesCommune):
        key = f"{direction}|{commune}|{ifp}"
        self._rates[key] = {
            "ifp": rates_ifp,
            "dir": rates_dir,
            "com": rates_com,
        }

    def get_rates(self, direction: str, commune: str, ifp: str
                  ) -> tuple[RatesIFP, RatesDirection, RatesCommune]:
        key = f"{direction}|{commune}|{ifp}"
        entry = self._rates.get(key)
        if entry is None:
            raise LookupError(
                f"No rates found for direction={direction}, "
                f"commune={commune}, ifp={ifp}"
            )
        if isinstance(entry["ifp"], RatesIFP):
            return entry["ifp"], entry["dir"], entry["com"]
        return self._from_dict(entry)

    @staticmethod
    def _from_dict(entry: dict) -> tuple[RatesIFP, RatesDirection, RatesCommune]:
        ri = entry["ifp"]
        rates_ifp = RatesIFP(**{k: _dec(v) for k, v in ri.items()})
        rd = entry["dir"]
        rates_dir = RatesDirection(**{k: _dec(v) for k, v in rd.items()})
        rc = entry["com"]
        rates_com = RatesCommune(**{k: _dec(v) for k, v in rc.items()})
        return rates_ifp, rates_dir, rates_com

    def save(self, path: str | Path):
        """Serialize current rates to JSON for test fixtures."""
        out = {}
        for key, entry in self._rates.items():
            out[key] = {
                "ifp": {k: str(v) for k, v in
                        (entry["ifp"].__dict__ if hasattr(entry["ifp"], "__dict__")
                         else entry["ifp"]).items()},
                "dir": {k: str(v) for k, v in
                        (entry["dir"].__dict__ if hasattr(entry["dir"], "__dict__")
                         else entry["dir"]).items()},
                "com": {k: str(v) for k, v in
                        (entry["com"].__dict__ if hasattr(entry["com"], "__dict__")
                         else entry["com"]).items()},
            }
        with open(path, "w") as f:
            json.dump(out, f, indent=2)
