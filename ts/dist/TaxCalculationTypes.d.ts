export interface Calculate {
    city?: string;
    disclaimer?: string;
    federal?: Record<string, any>;
    filingStatus?: string;
    income: number;
    input: Record<string, any>;
    local?: Record<string, any> | null;
    preTaxDeductions?: number;
    selfEmploymentIncome?: number;
    sources?: Record<string, any>;
    state?: Record<string, any> | null;
    taxYear?: number;
    totals?: Record<string, any>;
}
export interface CalculateLoadMatch {
    city?: string;
    filing_status?: string;
    income: number;
    pre_tax_deduction?: number;
    self_employment_income?: number;
    state?: string;
}
export interface CalculateCreateData {
    city?: string;
    filingStatus?: string;
    income: number;
    preTaxDeductions?: number;
    selfEmploymentIncome?: number;
    state?: Record<string, any> | null;
}
