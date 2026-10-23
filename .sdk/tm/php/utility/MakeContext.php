<?php
declare(strict_types=1);

// TaxCalculation SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class TaxCalculationMakeContext
{
    public static function call(array $ctxmap, ?TaxCalculationContext $basectx): TaxCalculationContext
    {
        return new TaxCalculationContext($ctxmap, $basectx);
    }
}
