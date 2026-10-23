import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "calculate",
    "accessor": "Calculate",
    "op": "create",
    "method": "POST",
    "path": "/api/v1/calculate",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": {
      "taxYear": 1,
      "input": {
        "income": 1,
        "state": "AL",
        "filingStatus": "single",
        "city": "x",
        "preTaxDeductions": 1,
        "selfEmploymentIncome": 1
      },
      "federal": {
        "adjustedGrossIncome": 1,
        "deduction": 1,
        "taxableIncome": 1,
        "incomeTax": 1,
        "socialSecurity": 1,
        "medicare": 1,
        "additionalMedicare": 1,
        "selfEmploymentTax": 1,
        "totalFica": 1,
        "marginalRate": 1,
        "brackets": [
          {
            "rate": 1,
            "taxableInBracket": 1,
            "tax": 1,
            "min": 1,
            "max": 1
          }
        ]
      },
      "state": {
        "code": "x",
        "name": "x",
        "tax": 1,
        "system": "graduated"
      },
      "local": {
        "jurisdiction": "x",
        "tax": 1,
        "rate": 1,
        "base": "x"
      },
      "totals": {
        "totalTax": 1,
        "netIncome": 1,
        "effectiveRate": 1,
        "effectiveIncomeTaxRate": 1
      },
      "sources": {
        "federal": {
          "citation": "x",
          "authority": "x",
          "document": "x",
          "url": "x",
          "verified": "2026-01-01",
          "checked": "2026-01-01"
        },
        "state": {
          "citation": "x",
          "authority": "x",
          "document": "x",
          "url": "x",
          "verified": "2026-01-01",
          "checked": "2026-01-01"
        },
        "local": {
          "citation": "x",
          "authority": "x",
          "document": "x",
          "url": "x",
          "verified": "2026-01-01",
          "checked": "2026-01-01"
        }
      },
      "disclaimer": "x"
    },
    "idField": "id"
  },
  {
    "entity": "calculate",
    "accessor": "Calculate",
    "op": "load",
    "method": "GET",
    "path": "/api/v1/calculate",
    "args": [],
    "select": {
      "income": "v1",
      "city": "v1",
      "filing_status": "single",
      "pre_tax_deduction": 0,
      "self_employment_income": 0,
      "state": "v1"
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "income",
      "state",
      "filingStatus",
      "city",
      "preTaxDeductions",
      "selfEmploymentIncome"
    ],
    "queryArgs": [
      {
        "name": "city",
        "wire": "city"
      },
      {
        "name": "filing_status",
        "wire": "filingStatus"
      },
      {
        "name": "income",
        "wire": "income"
      },
      {
        "name": "pre_tax_deduction",
        "wire": "preTaxDeductions"
      },
      {
        "name": "self_employment_income",
        "wire": "selfEmploymentIncome"
      },
      {
        "name": "state",
        "wire": "state"
      }
    ],
    "auth": null,
    "status": 200,
    "sample": {
      "taxYear": 1,
      "input": {
        "income": 1,
        "state": "AL",
        "filingStatus": "single",
        "city": "x",
        "preTaxDeductions": 1,
        "selfEmploymentIncome": 1
      },
      "federal": {
        "adjustedGrossIncome": 1,
        "deduction": 1,
        "taxableIncome": 1,
        "incomeTax": 1,
        "socialSecurity": 1,
        "medicare": 1,
        "additionalMedicare": 1,
        "selfEmploymentTax": 1,
        "totalFica": 1,
        "marginalRate": 1,
        "brackets": [
          {
            "rate": 1,
            "taxableInBracket": 1,
            "tax": 1,
            "min": 1,
            "max": 1
          }
        ]
      },
      "state": {
        "code": "x",
        "name": "x",
        "tax": 1,
        "system": "graduated"
      },
      "local": {
        "jurisdiction": "x",
        "tax": 1,
        "rate": 1,
        "base": "x"
      },
      "totals": {
        "totalTax": 1,
        "netIncome": 1,
        "effectiveRate": 1,
        "effectiveIncomeTaxRate": 1
      },
      "sources": {
        "federal": {
          "citation": "x",
          "authority": "x",
          "document": "x",
          "url": "x",
          "verified": "2026-01-01",
          "checked": "2026-01-01"
        },
        "state": {
          "citation": "x",
          "authority": "x",
          "document": "x",
          "url": "x",
          "verified": "2026-01-01",
          "checked": "2026-01-01"
        },
        "local": {
          "citation": "x",
          "authority": "x",
          "document": "x",
          "url": "x",
          "verified": "2026-01-01",
          "checked": "2026-01-01"
        }
      },
      "disclaimer": "x"
    },
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})
