# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'rack/test'

if ENV['COVERAGE'] == 'true'
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

Lotus::Application.preload!

module SpecUtils
  include Rack::Test::Methods

  def app
    @app
  end

  def response
    last_response
  end

  def post_json(uri, json)
    post uri, json.to_json, {"CONTENT_TYPE" => "application/json"}
  end
end