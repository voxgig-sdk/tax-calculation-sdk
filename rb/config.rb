# TaxCalculation SDK configuration

module TaxCalculationConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "TaxCalculation",
        "slug" => "tax-calculation",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "now" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://estimatetax.net",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "calculate" => {},
        },
      },
      "entity" => {
        "calculate" => {
          "fields" => [
            {
              "name" => "city",
              "title" => "City",
              "type" => "`$STRING`",
            },
            {
              "name" => "disclaimer",
              "title" => "Disclaimer",
              "type" => "`$STRING`",
            },
            {
              "name" => "federal",
              "title" => "Federal",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "filingStatus",
              "title" => "Filing Status",
              "type" => "`$STRING`",
            },
            {
              "name" => "income",
              "title" => "Income",
              "type" => "`$NUMBER`",
              "req" => true,
            },
            {
              "name" => "input",
              "title" => "Input",
              "type" => "`$OBJECT`",
              "req" => true,
            },
            {
              "name" => "local",
              "title" => "Local",
              "type" => [
                "`$ONE`",
                [
                  "`$OBJECT`",
                  "`$NULL`",
                ],
              ],
              "short" => "Present only where a county, city or school district levies its own.",
            },
            {
              "name" => "preTaxDeductions",
              "title" => "Pre Tax Deductions",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "selfEmploymentIncome",
              "title" => "Self Employment Income",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "sources",
              "title" => "Sources",
              "type" => "`$OBJECT`",
              "short" => "Where each layer of the calculation came from.",
            },
            {
              "name" => "state",
              "title" => "State",
              "type" => [
                "`$ONE`",
                [
                  "`$OBJECT`",
                  "`$NULL`",
                ],
              ],
            },
            {
              "name" => "taxYear",
              "title" => "Tax Year",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "totals",
              "title" => "Totals",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "calculate",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/api/v1/calculate",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v1",
                    },
                    {
                      "lit" => "calculate",
                    },
                  ],
                  "parts" => [
                    "api",
                    "v1",
                    "calculate",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {},
                  "select" => {},
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v1/calculate",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v1",
                    },
                    {
                      "lit" => "calculate",
                    },
                  ],
                  "parts" => [
                    "api",
                    "v1",
                    "calculate",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "query" => [
                      {
                        "name" => "city",
                        "orig" => "city",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "field" => true,
                      },
                      {
                        "name" => "filing_status",
                        "orig" => "filingStatus",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "single",
                      },
                      {
                        "name" => "income",
                        "orig" => "income",
                        "type" => "`$NUMBER`",
                        "kind" => "query",
                        "reqd" => true,
                        "field" => true,
                      },
                      {
                        "name" => "pre_tax_deduction",
                        "orig" => "preTaxDeductions",
                        "type" => "`$NUMBER`",
                        "kind" => "query",
                        "example" => 0,
                      },
                      {
                        "name" => "self_employment_income",
                        "orig" => "selfEmploymentIncome",
                        "type" => "`$NUMBER`",
                        "kind" => "query",
                        "example" => 0,
                      },
                      {
                        "name" => "state",
                        "orig" => "state",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "field" => true,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "income",
                    ],
                  },
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    TaxCalculationFeatures.make_feature(name)
  end
end
