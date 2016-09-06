require 'httparty'
require 'actionkit_connector/connector'
require 'actionkit_connector/client'
require 'actionkit_connector/rest/api'
require 'actionkit_connector/util'

module ActionKitConnector
  VERSION = '0.3.1'

  class << self
    attr_reader :client
    def config(username:, password:, host:)
      @client = ActionKitConnector::Client.new do |c|
        c.username = username
        c.password = password
        c.host     = host
      end
    end
  end
end

