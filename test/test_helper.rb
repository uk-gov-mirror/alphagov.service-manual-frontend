ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'
require 'support/govuk_content_schema_examples'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'slimmer/test'
require 'slimmer/test_helpers/shared_templates'

class ActiveSupport::TestCase
  include GovukContentSchemaExamples
end

# Note: This is so that slimmer is skipped, preventing network requests for
# content from static (i.e. core_layout.html.erb).
class ActionController::Base
  before_filter proc {
    response.headers[Slimmer::Headers::SKIP_HEADER] = "true" unless ENV["USE_SLIMMER"]
  }
end

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :poltergeist

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  include Slimmer::TestHelpers::SharedTemplates

  # When running JS tests with Capybara the app and the test runner run
  # in separate threads. Capybara shoots off http://localhost:<some port>/__identify__
  # requests to see if the app is ready. We don't want Webmock to block
  # these requests because the test suite will never run but we also don't
  # want to allow all localhost requests because we run these tests on VMs that
  # run a lot of services that might give us a false positive.
  driver_requests = %r{/__identify__$}
  WebMock.disable_net_connect! allow: driver_requests

  def using_javascript_driver(&block)
    begin
      Capybara.current_driver = Capybara.javascript_driver
      use_slimmer = ENV["USE_SLIMMER"]
      ENV["USE_SLIMMER"] = "true"

      block.call
    ensure
      Capybara.use_default_driver
      ENV.delete("USE_SLIMMER") unless use_slimmer
    end
  end

  def setup_and_visit_content_item(name)
    example = get_content_example(name)
    setup_and_visit_content_example(example)
  end

  def setup_and_visit_content_example(example)
    base_path = JSON.parse(example).fetch('base_path')

    content_store_has_item(base_path, example)
    visit base_path
  end

  def get_content_example(name)
    get_content_example_by_format_and_name(schema_format, name)
  end

  def get_content_example_by_format_and_name(format, name)
    GovukContentSchemaTestHelpers::Examples.new.get(format, name)
  end

  # Override this method if your test file doesn't match the convention
  def schema_format
    self.class.to_s.gsub('Test', '').underscore
  end
end
