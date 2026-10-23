# TaxCalculation SDK utility: prepare_body
require_relative 'media'
module TaxCalculationUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return TaxCalculationUtilities.raw_body(ctx.reqdata) if TaxCalculationUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
