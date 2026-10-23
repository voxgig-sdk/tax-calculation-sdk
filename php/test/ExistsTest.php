<?php
declare(strict_types=1);

// TaxCalculation SDK exists test

require_once __DIR__ . '/../taxcalculation_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = TaxCalculationSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
