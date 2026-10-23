

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { TaxCalculationSDK, BaseFeature, config, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('CalculateEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when TAX_CALCULATION_TEST_LIVE=TRUE.
  afterEach(liveDelay('TAX_CALCULATION_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = TaxCalculationSDK.test()
    const ent = testsdk.Calculate()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = TaxCalculationSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Calculate().load({"city":1,"income":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.TAX_CALCULATION_TEST_LIVE
    for (const op of ['create', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'calculate.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"city":{"a":true,"h":"City","n":"city","r":false,"t":"`$STRING`","key$":"city","index$":0},"disclaimer":{"a":true,"h":"Disclaimer","n":"disclaimer","r":false,"t":"`$STRING`","key$":"disclaimer","index$":1},"federal":{"a":true,"h":"Federal","n":"federal","r":false,"t":"`$OBJECT`","key$":"federal","index$":2},"filingStatus":{"a":true,"h":"Filing Status","n":"filingStatus","r":false,"t":"`$STRING`","key$":"filingStatus","index$":3},"income":{"a":true,"h":"Income","n":"income","r":true,"t":"`$NUMBER`","key$":"income","index$":4},"input":{"a":true,"h":"Input","n":"input","r":true,"t":"`$OBJECT`","key$":"input","index$":5},"local":{"a":true,"h":"Local","n":"local","r":false,"sh":"Present only where a county, city or school district levies its own.","t":["`$ONE`",["`$OBJECT`","`$NULL`"]],"key$":"local","index$":6},"preTaxDeductions":{"a":true,"h":"Pre Tax Deductions","n":"preTaxDeductions","r":false,"t":"`$NUMBER`","key$":"preTaxDeductions","index$":7},"selfEmploymentIncome":{"a":true,"h":"Self Employment Income","n":"selfEmploymentIncome","r":false,"t":"`$NUMBER`","key$":"selfEmploymentIncome","index$":8},"sources":{"a":true,"h":"Sources","n":"sources","r":false,"sh":"Where each layer of the calculation came from.","t":"`$OBJECT`","key$":"sources","index$":9},"state":{"a":true,"h":"State","n":"state","r":false,"t":["`$ONE`",["`$OBJECT`","`$NULL`"]],"key$":"state","index$":10},"taxYear":{"a":true,"h":"Tax Year","n":"taxYear","r":false,"t":"`$INTEGER`","key$":"taxYear","index$":11},"totals":{"a":true,"h":"Totals","n":"totals","r":false,"t":"`$OBJECT`","key$":"totals","index$":12}},"name":"calculate","op":{"create":{"input":"data","name":"create","points":[{"a":true,"bf":["city","filingStatus","income","preTaxDeductions","selfEmploymentIncome","state"],"co":{"id":"POST /api/v1/calculate","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/api/v1/calculate","q":{},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"api"},{"lit":"v1"},{"lit":"calculate"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /api/v1/calculate","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"city","or":"city","r":false,"t":"`$STRING`","index$":0},{"a":true,"ex":"single","k":"query","n":"filing_status","or":"filingStatus","r":false,"t":"`$STRING`","index$":1},{"a":true,"k":"query","n":"income","or":"income","r":true,"t":"`$NUMBER`","index$":2},{"a":true,"ex":0,"k":"query","n":"pre_tax_deduction","or":"preTaxDeductions","r":false,"t":"`$NUMBER`","index$":3},{"a":true,"ex":0,"k":"query","n":"self_employment_income","or":"selfEmploymentIncome","r":false,"t":"`$NUMBER`","index$":4},{"a":true,"k":"query","n":"state","or":"state","r":false,"t":"`$STRING`","index$":5}]},"k":"http","m":"GET","o":"/api/v1/calculate","q":{"exist":["income"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"api"},{"lit":"v1"},{"lit":"calculate"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"calculate","name__orig":"calculate","Name":"Calculate","name_":"calculate","name-":"calculate","NAME":"CALCULATE","index$":0}, {"active":true,"entity":"calculate","key$":"BasicCalculateFlow","kind":"basic","name":"BasicCalculateFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"calculate_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{"ref":"calculate_ref01","srcdatavar":"calculate_ref01_data","suffix":"_dt0"},"m":{},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-calculate_ref01"}}],"index$":1}]}, 'Calculate', {"POST /api/v1/calculate":{"protocol":"http","requestBody":{"required":true,"content":{"application/json":{"schema":{"type":"object","required":["income"],"properties":{"income":{"type":"number","minimum":0,"key$":"income"},"state":{"type":"string","enum":["AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"],"key$":"state"},"filingStatus":{"type":"string","enum":["single","married_jointly","married_separately","head_of_household"],"default":"single","key$":"filingStatus"},"city":{"type":"string","key$":"city"},"preTaxDeductions":{"type":"number","minimum":0,"default":0,"key$":"preTaxDeductions"},"selfEmploymentIncome":{"type":"number","minimum":0,"default":0,"key$":"selfEmploymentIncome"}},"x-ref":"#/components/schemas/Input","index$":1}}}},"parameters":[]},"GET /api/v1/calculate":{"protocol":"http","parameters":[{"name":"income","in":"query","required":true,"description":"Gross annual employment income, in US dollars.","schema":{"type":"number","minimum":0,"examples":[100000]},"index$":0},{"name":"state","in":"query","required":false,"description":"Two-letter state code. Omit for federal only.","schema":{"type":"string","enum":["AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]},"index$":1},{"name":"filingStatus","in":"query","required":false,"schema":{"type":"string","enum":["single","married_jointly","married_separately","head_of_household"],"default":"single"},"index$":2},{"name":"city","in":"query","required":false,"description":"Slug of the county, city or school district that levies a local income tax, for example \"allegany-county\" in MD or \"new-york-city\" in NY. Only meaningful in the eleven states with a local income tax.","schema":{"type":"string","examples":["allegany-county"]},"index$":3},{"name":"preTaxDeductions","in":"query","required":false,"description":"Pre-tax deductions such as 401(k) or health premiums, in US dollars.","schema":{"type":"number","minimum":0,"default":0},"index$":4},{"name":"selfEmploymentIncome","in":"query","required":false,"description":"Net self-employment income, taxed for both halves of FICA.","schema":{"type":"number","minimum":0,"default":0},"index$":5}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const calculate_ref01_ent = client.Calculate()
    let calculate_ref01_data = setup.data.new.calculate['calculate_ref01']

    calculate_ref01_data = (await calculate_ref01_ent.create(calculate_ref01_data)).data()
    assert(null != calculate_ref01_data)


    // LOAD
    const calculate_ref01_match_dt0: any = {}
    const calculate_ref01_data_dt0 = (await calculate_ref01_ent.load(calculate_ref01_match_dt0)).data()
    assert(null != calculate_ref01_data_dt0)


  })
})



// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true

function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/calculate/CalculateTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = TaxCalculationSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['calculate01','calculate02','calculate03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'TAX_CALCULATION_TEST_CALCULATE_ENTID': idmap,
    'TAX_CALCULATION_TEST_LIVE': 'FALSE',
    'TAX_CALCULATION_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['TAX_CALCULATION_TEST_CALCULATE_ENTID']

  const live = 'TRUE' === env.TAX_CALCULATION_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['TAX_CALCULATION_TEST_CALCULATE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new TaxCalculationSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.TAX_CALCULATION_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
