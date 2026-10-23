# Typed models for the TaxCalculation SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class CalculateRequired(TypedDict):
    income: float
    input: dict


class Calculate(CalculateRequired, total=False):
    city: str
    disclaimer: str
    federal: dict
    filingStatus: str
    local: dict | None
    preTaxDeductions: float
    selfEmploymentIncome: float
    sources: dict
    state: dict | None
    taxYear: int
    totals: dict


class CalculateLoadMatchRequired(TypedDict):
    income: float


class CalculateLoadMatch(CalculateLoadMatchRequired, total=False):
    city: str
    filing_status: str
    pre_tax_deduction: float
    self_employment_income: float
    state: str


class CalculateCreateDataRequired(TypedDict):
    income: float


class CalculateCreateData(CalculateCreateDataRequired, total=False):
    city: str
    filingStatus: str
    preTaxDeductions: float
    selfEmploymentIncome: float
    state: dict | None
