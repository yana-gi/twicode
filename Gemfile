# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

# not default
gem 'meta-tags'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-twitter'
gem 'slim-rails'

group :production do
  gem 'aws-sdk-s3', require: false
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # not default
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'slim_lint'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'

  # not default
  gem 'rubocop-fjord', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
