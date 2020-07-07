# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.1'

# rack
gem 'rack', '~> 2.1.4'

# Config
gem 'config', '~> 2.2.1'

# rabbitmq
gem 'bunny', '~> 2.15.0'

# serialization
gem 'fast_jsonapi', '~> 1.5'

# http client
gem 'faraday', '~> 1.0.1'
gem 'faraday_middleware', '~> 1.0.0'

group :development do
  gem 'rubocop', '~> 0.85.0', require: false
  gem 'rubocop-performance', require: false
end

group :test do
  gem 'rack-test', '~> 1.1.0'
  gem 'rspec', '~> 3.9.0'
end
