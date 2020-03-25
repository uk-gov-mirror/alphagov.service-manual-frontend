source "https://rubygems.org"

ruby File.read(".ruby-version").strip

gem "gds-api-adapters", "~> 63.5.1"
gem "govuk_app_config", "~> 2.1"
gem "govuk_publishing_components", "~> 21.35.0"
gem "plek", "3.0.0"
gem "rails", "~> 5.2.4"
gem "rails-i18n", "~> 5.1.3"
gem "rails_translation_manager", "~> 0.1.0"
gem "sass-rails", "~> 5.0.6"
gem "slimmer", "~> 13.2.2"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "jasmine-rails"
  gem "phantomjs", "~> 2.1", ">= 2.1.1.0"
  gem "rubocop-govuk"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "listen", ">= 3.0.5", "< 3.3"
  gem "web-console", "~> 3.7"
  gem "wraith", "~> 4.2"
end

group :test do
  gem "capybara"
  gem "govuk-content-schema-test-helpers", "~> 1.6"
  gem "poltergeist"
  gem "pry-byebug"
  gem "rails-controller-testing"
  gem "webmock", "~> 3.8.3", require: false
end
