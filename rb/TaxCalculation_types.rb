# frozen_string_literal: true

# Typed models for the TaxCalculation SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Calculate entity data model.
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] disclaimer
#   @return [String, nil]
#
# @!attribute [rw] federal
#   @return [Hash, nil]
#
# @!attribute [rw] filingStatus
#   @return [String, nil]
#
# @!attribute [rw] income
#   @return [Float]
#
# @!attribute [rw] input
#   @return [Hash]
#
# @!attribute [rw] local
#   @return [Object, nil]
#
# @!attribute [rw] preTaxDeductions
#   @return [Float, nil]
#
# @!attribute [rw] selfEmploymentIncome
#   @return [Float, nil]
#
# @!attribute [rw] sources
#   @return [Hash, nil]
#
# @!attribute [rw] state
#   @return [Object, nil]
#
# @!attribute [rw] taxYear
#   @return [Integer, nil]
#
# @!attribute [rw] totals
#   @return [Hash, nil]
Calculate = Struct.new(
  :city,
  :disclaimer,
  :federal,
  :filingStatus,
  :income,
  :input,
  :local,
  :preTaxDeductions,
  :selfEmploymentIncome,
  :sources,
  :state,
  :taxYear,
  :totals,
  keyword_init: true
)

# Request payload for Calculate#load.
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] filing_status
#   @return [String, nil]
#
# @!attribute [rw] income
#   @return [Float]
#
# @!attribute [rw] pre_tax_deduction
#   @return [Float, nil]
#
# @!attribute [rw] self_employment_income
#   @return [Float, nil]
#
# @!attribute [rw] state
#   @return [String, nil]
CalculateLoadMatch = Struct.new(
  :city,
  :filing_status,
  :income,
  :pre_tax_deduction,
  :self_employment_income,
  :state,
  keyword_init: true
)

# Request payload for Calculate#create.
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] filingStatus
#   @return [String, nil]
#
# @!attribute [rw] income
#   @return [Float]
#
# @!attribute [rw] preTaxDeductions
#   @return [Float, nil]
#
# @!attribute [rw] selfEmploymentIncome
#   @return [Float, nil]
#
# @!attribute [rw] state
#   @return [Object, nil]
CalculateCreateData = Struct.new(
  :city,
  :filingStatus,
  :income,
  :preTaxDeductions,
  :selfEmploymentIncome,
  :state,
  keyword_init: true
)

