# TaxCalculation SDK exists test

import pytest
from taxcalculation_sdk import TaxCalculationSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = TaxCalculationSDK.test(None, None)
        assert testsdk is not None
