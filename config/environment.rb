require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/headlines'
require_relative '../apps/api/application'

Lotus::Container.configure do
  mount Api::Application, at: '/api'
end
