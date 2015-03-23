# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'rack/test'

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    command_name 'test'
    add_filter   'test'
  end
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