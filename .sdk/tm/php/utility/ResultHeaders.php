<?php
declare(strict_types=1);

// TaxCalculation SDK utility: result_headers

class TaxCalculationResultHeaders
{
    public static function call(TaxCalculationContext $ctx): ?TaxCalculationResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
