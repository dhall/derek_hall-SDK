# frozen_string_literal: true

require "lotr/sdk"
require 'webmock/rspec'
require 'vcr'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :webmock
  c.ignore_localhost = true
  c.ignore_hosts "chromedriver.storage.googleapis.com"
  c.default_cassette_options = { :record => :new_episodes }
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
