# TaxCalculation SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "TaxCalculation",
            "slug": "tax-calculation",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
          "factor": 2,
          "maxDelay": 2000,
          "minDelay": 50,
          "retries": 2,
          "statuses": [
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "now": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://estimatetax.net",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "calculate": {},
            },
        },
        "entity": {
      "calculate": {
        "fields": [
          {
            "name": "city",
            "title": "City",
            "type": "`$STRING`",
          },
          {
            "name": "disclaimer",
            "title": "Disclaimer",
            "type": "`$STRING`",
          },
          {
            "name": "federal",
            "title": "Federal",
            "type": "`$OBJECT`",
          },
          {
            "name": "filingStatus",
            "title": "Filing Status",
            "type": "`$STRING`",
          },
          {
            "name": "income",
            "title": "Income",
            "type": "`$NUMBER`",
            "req": True,
          },
          {
            "name": "input",
            "title": "Input",
            "type": "`$OBJECT`",
            "req": True,
          },
          {
            "name": "local",
            "title": "Local",
            "type": [
              "`$ONE`",
              [
                "`$OBJECT`",
                "`$NULL`",
              ],
            ],
            "short": "Present only where a county, city or school district levies its own.",
          },
          {
            "name": "preTaxDeductions",
            "title": "Pre Tax Deductions",
            "type": "`$NUMBER`",
          },
          {
            "name": "selfEmploymentIncome",
            "title": "Self Employment Income",
            "type": "`$NUMBER`",
          },
          {
            "name": "sources",
            "title": "Sources",
            "type": "`$OBJECT`",
            "short": "Where each layer of the calculation came from.",
          },
          {
            "name": "state",
            "title": "State",
            "type": [
              "`$ONE`",
              [
                "`$OBJECT`",
                "`$NULL`",
              ],
            ],
          },
          {
            "name": "taxYear",
            "title": "Tax Year",
            "type": "`$INTEGER`",
          },
          {
            "name": "totals",
            "title": "Totals",
            "type": "`$OBJECT`",
          },
        ],
        "name": "calculate",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/api/v1/calculate",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "v1",
                  },
                  {
                    "lit": "calculate",
                  },
                ],
                "parts": [
                  "api",
                  "v1",
                  "calculate",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/api/v1/calculate",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "v1",
                  },
                  {
                    "lit": "calculate",
                  },
                ],
                "parts": [
                  "api",
                  "v1",
                  "calculate",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "city",
                      "orig": "city",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "filing_status",
                      "orig": "filingStatus",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "single",
                    },
                    {
                      "name": "income",
                      "orig": "income",
                      "type": "`$NUMBER`",
                      "kind": "query",
                      "reqd": True,
                      "field": True,
                    },
                    {
                      "name": "pre_tax_deduction",
                      "orig": "preTaxDeductions",
                      "type": "`$NUMBER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "self_employment_income",
                      "orig": "selfEmploymentIncome",
                      "type": "`$NUMBER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "state",
                      "orig": "state",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "income",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
