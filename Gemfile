source 'https://rubygems.org'

ruby File.read(".ruby-version").strip

gem "govuk_app_config", "~> 1.4"
gem 'govuk_elements_rails'
gem 'govuk_frontend_toolkit', '~> 7.4.2'
gem 'plek', '2.1.1'
gem 'rails', '~> 5.1.5'
gem 'rails-i18n', '~> 5.1.1'
gem 'rails_translation_manager', '~> 0.0.2'
gem 'sass-rails', '~> 5.0.6'
gem 'slimmer', '~> 11.1.1'
gem 'uglifier', '>= 1.3.0'

if ENV['API_DEV']
  gem 'gds-api-adapters', path: '../gds-api-adapters'
else
  gem 'gds-api-adapters', '~> 52.0.0'
end

group :development, :test do
  gem "jasmine-rails"
  gem 'govuk-lint'
  gem 'phantomjs', '~> 2.1.1'
  gem 'wraith', '~> 4.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '~> 3.5'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'webmock', '~> 3.3.0', require: false
  gem 'govuk-content-schema-test-helpers', '~> 1.6'
  gem 'pry-byebug'
  gem 'rails-controller-testing'
end
