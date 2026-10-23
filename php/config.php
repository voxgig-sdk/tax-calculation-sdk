<?php
declare(strict_types=1);

// TaxCalculation SDK configuration

class TaxCalculationConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "TaxCalculation",
                "slug" => "tax-calculation",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "retry" => [
          'options' => [
            'active' => false,
            'factor' => 2,
            'maxDelay' => 2000,
            'minDelay' => 50,
            'retries' => 2,
            'statuses' => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          ],
          'optspec' => [
            'jitter' => '`$BOOLEAN`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'entity' => '`$MAP`',
            'net' => '`$MAP`',
          ],
          'strict' => false,
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'optspec' => [
            'clearTimer' => '`$FUNCTION`',
            'now' => '`$FUNCTION`',
            'setTimer' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
            ],
            "options" => [
                "base" => "https://estimatetax.net",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "calculate" => [],
                ],
            ],
            "entity" => [
        'calculate' => [
          'fields' => [
            [
              'name' => 'city',
              'title' => 'City',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'disclaimer',
              'title' => 'Disclaimer',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'federal',
              'title' => 'Federal',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'filingStatus',
              'title' => 'Filing Status',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'income',
              'title' => 'Income',
              'type' => '`$NUMBER`',
              'req' => true,
            ],
            [
              'name' => 'input',
              'title' => 'Input',
              'type' => '`$OBJECT`',
              'req' => true,
            ],
            [
              'name' => 'local',
              'title' => 'Local',
              'type' => [
                '`$ONE`',
                [
                  '`$OBJECT`',
                  '`$NULL`',
                ],
              ],
              'short' => 'Present only where a county, city or school district levies its own.',
            ],
            [
              'name' => 'preTaxDeductions',
              'title' => 'Pre Tax Deductions',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'selfEmploymentIncome',
              'title' => 'Self Employment Income',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'sources',
              'title' => 'Sources',
              'type' => '`$OBJECT`',
              'short' => 'Where each layer of the calculation came from.',
            ],
            [
              'name' => 'state',
              'title' => 'State',
              'type' => [
                '`$ONE`',
                [
                  '`$OBJECT`',
                  '`$NULL`',
                ],
              ],
            ],
            [
              'name' => 'taxYear',
              'title' => 'Tax Year',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'totals',
              'title' => 'Totals',
              'type' => '`$OBJECT`',
            ],
          ],
          'name' => 'calculate',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'POST',
                  'orig' => '/api/v1/calculate',
                  'segments' => [
                    [
                      'lit' => 'api',
                    ],
                    [
                      'lit' => 'v1',
                    ],
                    [
                      'lit' => 'calculate',
                    ],
                  ],
                  'parts' => [
                    'api',
                    'v1',
                    'calculate',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [],
                  'select' => [],
                  'response' => [
                    'kind' => 'json',
                    'media' => 'application/json',
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/api/v1/calculate',
                  'segments' => [
                    [
                      'lit' => 'api',
                    ],
                    [
                      'lit' => 'v1',
                    ],
                    [
                      'lit' => 'calculate',
                    ],
                  ],
                  'parts' => [
                    'api',
                    'v1',
                    'calculate',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'query' => [
                      [
                        'name' => 'city',
                        'orig' => 'city',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'field' => true,
                      ],
                      [
                        'name' => 'filing_status',
                        'orig' => 'filingStatus',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'example' => 'single',
                      ],
                      [
                        'name' => 'income',
                        'orig' => 'income',
                        'type' => '`$NUMBER`',
                        'kind' => 'query',
                        'reqd' => true,
                        'field' => true,
                      ],
                      [
                        'name' => 'pre_tax_deduction',
                        'orig' => 'preTaxDeductions',
                        'type' => '`$NUMBER`',
                        'kind' => 'query',
                        'example' => 0,
                      ],
                      [
                        'name' => 'self_employment_income',
                        'orig' => 'selfEmploymentIncome',
                        'type' => '`$NUMBER`',
                        'kind' => 'query',
                        'example' => 0,
                      ],
                      [
                        'name' => 'state',
                        'orig' => 'state',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'field' => true,
                      ],
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'income',
                    ],
                  ],
                  'response' => [
                    'kind' => 'json',
                    'media' => 'application/json',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return TaxCalculationFeatures::make_feature($name);
    }
}
