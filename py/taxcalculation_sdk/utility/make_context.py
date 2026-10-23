# TaxCalculation SDK utility: make_context

from taxcalculation_sdk.core.context import TaxCalculationContext


def make_context_util(ctxmap, basectx):
    return TaxCalculationContext(ctxmap, basectx)
