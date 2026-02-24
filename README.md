# taxe-fonciere-python

Python translation of the French property tax calculator (taxe foncière), originally written in COBOL by DGFiP (Direction Générale des Finances Publiques).

## What is this

The French government publishes the source code of its property tax calculation engine as COBOL programs on [data.gouv.fr](https://www.data.gouv.fr/fr/datasets/code-source-du-calcul-de-la-taxe-fonciere/). This repository contains:

1. **Original COBOL source** — versions 2018, 2020, 2021, 2022, 2023 (from official etalab repository)
2. **Python translation** — aligned with the 2023 COBOL version (EFITA3B3 / EFITA3N3)
3. **Tests** — 24 pytest tests verifying the translation against manual calculations

## Structure

```
src/
├── python/                 ← Python translation
│   ├── models.py           ← Data structures (from COBOL copybooks)
│   ├── calc_bati.py        ← Built property calculator (EFITA3B3)
│   ├── calc_non_bati.py    ← Non-built property calculator (EFITA3N3)
│   ├── rounding.py         ← COBOL COMPUTE ROUNDED emulation
│   └── rates.py            ← Tax rate provider (mock)
├── cobol/                  ← Original COBOL 2018
├── cobol-2020/             ← COBOL 2020
├── cobol-2021/             ← COBOL 2021
├── cobol-2022/             ← COBOL 2022
└── cobol-2023/             ← COBOL 2023 (current reference)

tests/
├── test_bati.py            ← 11 tests for built property
└── test_non_bati.py        ← 13 tests for non-built property
```

## Key translation decisions

- **`COMPUTE ROUNDED`** → Python `Decimal` with `ROUND_HALF_UP` (not banker's rounding)
- **`COPY REPLACING`** → Python dataclasses with explicit field mapping
- **`CALL USING`** → Python function calls
- **`ORGANIZATION INDEXED`** (EFITAUX2) → Mock rate provider class
- **All monetary values are integers** (euros, no cents) — matches COBOL `PIC S9(10)`

## Changes from 2018 to 2023

The COBOL source evolved between 2018 and 2023 with two notable changes:

1. **Département tax removed from bâti** (2020 reform) — the departmental property tax on built properties was abolished and transferred to communes
2. **TOTOFR flag** — new mechanism for TEOM (waste collection tax) transfer regime: when `TAU-R-TOTOFR = 'O'`, OM cotisations go into the 3% frais bucket instead of 8%

## Running tests

```bash
pip install pytest
pytest tests/ -v
```

All 24 tests pass:
- Validation checks (year, property type, numeric bases, OM zones)
- Cotisation calculations (commune, syndicat, EPCI, GEMAPI, TASA, TSE, OM)
- Frais de gestion (3%, 8%, 9% fee tiers with rééquilibrage)
- CAAA (droit fixe for département 57, droit proportionnel)
- Saint-Martin special case (971/127)
- Dégrévement jeunes agriculteurs
- TOTOFR transfer regime (both modes)

## Origin

Original COBOL source: [etalab/taxe_fonciere on GitLab](https://gitlab.adullact.net/dgfip/taxe_fonciere) (also [GitHub mirror](https://github.com/etalab/taxe-fonciere), frozen at 2018).

Translation produced as part of the [CobolD](https://github.com/DukeDeSouth) project — systematic verified COBOL-to-Python migration.

## License

Original COBOL source is under **CeCILL v2.1** (French open source license, GPL-compatible).
Python translation is under the same license — see [LICENSE](LICENSE).
