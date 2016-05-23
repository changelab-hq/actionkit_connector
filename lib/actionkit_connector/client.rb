require 'uri'
require 'actionkit_connector/rest/api'

module ActionKitConnector
  class Client
    include HTTParty
    include ActionKitConnector::REST::API
    attr_accessor :host, :username, :password

    headers({'Content-Type' => 'application/json', 'charset' => 'UTF-8'})

    # Initialises a new Client object
    #
    # @param options [Hash]
    # @return [ActionKitConnector::Client]
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      yield(self) if block_given?
      self.class.base_uri(base_uri)
    end

    # @return [Hash]
    def credentials
      {
        username: username,
        password: password
      }
    end

    def prep_options(data)
      basic_auth.merge(body: data.to_json)
    end

    def basic_auth
      { basic_auth: credentials }
    end

    def base_uri
      URI.join(host, '/rest/v1/').to_s
    end
  end
end
