# TaxCalculation SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

TaxCalculationUtility.registrar = ->(u) {
  u.clean = TaxCalculationUtilities::Clean
  u.clean_add = TaxCalculationUtilities::CleanAdd
  u.clean_explain = TaxCalculationUtilities::CleanExplain
  u.done = TaxCalculationUtilities::Done
  u.make_error = TaxCalculationUtilities::MakeError
  u.feature_add = TaxCalculationUtilities::FeatureAdd
  u.feature_hook = TaxCalculationUtilities::FeatureHook
  u.feature_init = TaxCalculationUtilities::FeatureInit
  u.fetcher = TaxCalculationUtilities::Fetcher
  u.make_fetch_def = TaxCalculationUtilities::MakeFetchDef
  u.make_context = TaxCalculationUtilities::MakeContext
  u.make_options = TaxCalculationUtilities::MakeOptions
  u.make_request = TaxCalculationUtilities::MakeRequest
  u.make_response = TaxCalculationUtilities::MakeResponse
  u.make_result = TaxCalculationUtilities::MakeResult
  u.make_point = TaxCalculationUtilities::MakePoint
  u.make_spec = TaxCalculationUtilities::MakeSpec
  u.make_url = TaxCalculationUtilities::MakeUrl
  u.param = TaxCalculationUtilities::Param
  u.prepare_auth = TaxCalculationUtilities::PrepareAuth
  u.prepare_body = TaxCalculationUtilities::PrepareBody
  u.prepare_headers = TaxCalculationUtilities::PrepareHeaders
  u.prepare_method = TaxCalculationUtilities::PrepareMethod
  u.prepare_params = TaxCalculationUtilities::PrepareParams
  u.prepare_path = TaxCalculationUtilities::PreparePath
  u.prepare_query = TaxCalculationUtilities::PrepareQuery
  u.graphql_body = TaxCalculationUtilities::GraphqlBody
  u.graphql_errors = TaxCalculationUtilities::GraphqlErrors
  u.result_basic = TaxCalculationUtilities::ResultBasic
  u.result_body = TaxCalculationUtilities::ResultBody
  u.result_headers = TaxCalculationUtilities::ResultHeaders
  u.transform_request = TaxCalculationUtilities::TransformRequest
  u.transform_response = TaxCalculationUtilities::TransformResponse
}
