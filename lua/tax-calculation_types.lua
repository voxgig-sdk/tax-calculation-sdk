-- Typed models for the TaxCalculation SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Calculate
---@field city? string
---@field disclaimer? string
---@field federal? table
---@field filingStatus? string
---@field income number
---@field input table
---@field local? table|nil
---@field preTaxDeductions? number
---@field selfEmploymentIncome? number
---@field sources? table
---@field state? table|nil
---@field taxYear? number
---@field totals? table

---@class CalculateLoadMatch
---@field city? string
---@field filing_status? string
---@field income number
---@field pre_tax_deduction? number
---@field self_employment_income? number
---@field state? string

---@class CalculateCreateData
---@field city? string
---@field filingStatus? string
---@field income number
---@field preTaxDeductions? number
---@field selfEmploymentIncome? number
---@field state? table|nil

local M = {}

return M
