<?php
declare(strict_types=1);

// Typed models for the TaxCalculation SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Calculate entity data model. */
class Calculate
{
    public ?string $city = null;
    public ?string $disclaimer = null;
    public ?array $federal = null;
    public ?string $filingStatus = null;
    public float $income;
    public array $input;
    public mixed $local = null;
    public ?float $preTaxDeductions = null;
    public ?float $selfEmploymentIncome = null;
    public ?array $sources = null;
    public mixed $state = null;
    public ?int $taxYear = null;
    public ?array $totals = null;
}

/** Request payload for Calculate#load. */
class CalculateLoadMatch
{
    public ?string $city = null;
    public ?string $filing_status = null;
    public float $income;
    public ?float $pre_tax_deduction = null;
    public ?float $self_employment_income = null;
    public ?string $state = null;
}

/** Request payload for Calculate#create. */
class CalculateCreateData
{
    public ?string $city = null;
    public ?string $filingStatus = null;
    public float $income;
    public ?float $preTaxDeductions = null;
    public ?float $selfEmploymentIncome = null;
    public mixed $state = null;
}

