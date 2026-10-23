# TaxCalculation SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module TaxCalculationFeatures
  def self.make_feature(name)
    case name
    when "base"
      TaxCalculationBaseFeature.new
    when "ratelimit"
      TaxCalculationRatelimitFeature.new
    when "retry"
      TaxCalculationRetryFeature.new
    when "test"
      TaxCalculationTestFeature.new
    when "timeout"
      TaxCalculationTimeoutFeature.new
    else
      TaxCalculationBaseFeature.new
    end
  end
end
