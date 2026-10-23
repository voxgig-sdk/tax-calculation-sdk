
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { TaxCalculationSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = TaxCalculationSDK.test()
    equal(testsdk instanceof TaxCalculationSDK, true,
      'TaxCalculationSDK.test() must return a client synchronously')
  })

})
