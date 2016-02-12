require 'rspec'
require 'webmock/rspec'
require 'vcr'
require './lib/actionkit_connector'

# Use valid credentials when re-recording VCR cassettes
#
ENV['AK_U'] = "DummyUsername"
ENV['AK_P'] = "DummyPassword"
ENV['AK_H'] = "https://act.sumofus.org/rest/v1/"

module ClientHelper
  def client
    ActionKitConnector::Client.new do |c|
      c.username = ENV['AK_U']
      c.password = ENV['AK_P']
      c.host     = "https://act.sumofus.org"
    end
  end
end

RSpec.configure do |c|
  c.include ClientHelper
  c.filter_run focus: true
  c.run_all_when_everything_filtered = true
end


VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("<PASSWORD>") { ENV['AK_P'] }
  config.filter_sensitive_data("<USERNAME>") { ENV['AK_U'] }
end

