-- TaxCalculation SDK exists test

local sdk = require("tax-calculation_sdk")

describe("TaxCalculationSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
