# TaxCalculation SDK utility: make_context
require_relative '../core/context'
module TaxCalculationUtilities
  MakeContext = ->(ctxmap, basectx) {
    TaxCalculationContext.new(ctxmap, basectx)
  }
end
