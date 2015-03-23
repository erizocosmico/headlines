require 'lotus/model'

module Headlines
end

Dir["#{ __dir__ }/headlines/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  adapter type: :sql, uri: ENV['HEADLINES_DATABASE_URL']
  mapping "#{__dir__}/config/mapping"
end.load!
