source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotusrb',      '0.2.1'
gem 'lotus-model', '~> 0.2'
gem 'bcrypt', '~> 3.1.5'

platforms :ruby do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'jdbc-sqlite3'
end

group :test do
  gem 'minitest'
  gem 'capybara'
  gem "codeclimate-test-reporter"
end

group :production do
  gem 'puma'
end

gem 'simplecov', require: false
gem 'coveralls', require: false