require 'rspec'
require 'webmock/rspec'
require 'vcr'
require './lib/actionkit_connector'

# Use valid credentials when re-recording VCR cassettes
#
ENV['AK_U'] = "DummyUsername"
ENV['AK_P'] = "DummyPassword"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("<PASSWORD>") { ENV['AK_P'] }
  config.filter_sensitive_data("<USERNAME>") { ENV['AK_U'] }
end

