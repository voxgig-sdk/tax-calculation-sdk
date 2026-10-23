-- TaxCalculation SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "TaxCalculation",
      slug = "tax-calculation",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["now"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://estimatetax.net",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["calculate"] = {},
      },
    },
    entity = {
      ["calculate"] = {
        ["fields"] = {
          {
            ["name"] = "city",
            ["title"] = "City",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "disclaimer",
            ["title"] = "Disclaimer",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "federal",
            ["title"] = "Federal",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "filingStatus",
            ["title"] = "Filing Status",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "income",
            ["title"] = "Income",
            ["type"] = "`$NUMBER`",
            ["req"] = true,
          },
          {
            ["name"] = "input",
            ["title"] = "Input",
            ["type"] = "`$OBJECT`",
            ["req"] = true,
          },
          {
            ["name"] = "local",
            ["title"] = "Local",
            ["type"] = {
              "`$ONE`",
              {
                "`$OBJECT`",
                "`$NULL`",
              },
            },
            ["short"] = "Present only where a county, city or school district levies its own.",
          },
          {
            ["name"] = "preTaxDeductions",
            ["title"] = "Pre Tax Deductions",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "selfEmploymentIncome",
            ["title"] = "Self Employment Income",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "sources",
            ["title"] = "Sources",
            ["type"] = "`$OBJECT`",
            ["short"] = "Where each layer of the calculation came from.",
          },
          {
            ["name"] = "state",
            ["title"] = "State",
            ["type"] = {
              "`$ONE`",
              {
                "`$OBJECT`",
                "`$NULL`",
              },
            },
          },
          {
            ["name"] = "taxYear",
            ["title"] = "Tax Year",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "totals",
            ["title"] = "Totals",
            ["type"] = "`$OBJECT`",
          },
        },
        ["name"] = "calculate",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/api/v1/calculate",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "v1",
                  },
                  {
                    ["lit"] = "calculate",
                  },
                },
                ["parts"] = {
                  "api",
                  "v1",
                  "calculate",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {},
                ["select"] = {},
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/v1/calculate",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "v1",
                  },
                  {
                    ["lit"] = "calculate",
                  },
                },
                ["parts"] = {
                  "api",
                  "v1",
                  "calculate",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["query"] = {
                    {
                      ["name"] = "city",
                      ["orig"] = "city",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["field"] = true,
                    },
                    {
                      ["name"] = "filing_status",
                      ["orig"] = "filingStatus",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["example"] = "single",
                    },
                    {
                      ["name"] = "income",
                      ["orig"] = "income",
                      ["type"] = "`$NUMBER`",
                      ["kind"] = "query",
                      ["reqd"] = true,
                      ["field"] = true,
                    },
                    {
                      ["name"] = "pre_tax_deduction",
                      ["orig"] = "preTaxDeductions",
                      ["type"] = "`$NUMBER`",
                      ["kind"] = "query",
                      ["example"] = 0,
                    },
                    {
                      ["name"] = "self_employment_income",
                      ["orig"] = "selfEmploymentIncome",
                      ["type"] = "`$NUMBER`",
                      ["kind"] = "query",
                      ["example"] = 0,
                    },
                    {
                      ["name"] = "state",
                      ["orig"] = "state",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["field"] = true,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "income",
                  },
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
