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

    def pager_for(uri)
      Enumerator.new do |yielder|
        query = { _offset: 0, _limit: 100 }
        options = prep_options({}).merge(query: query)

        loop do
          response = self.class.get(uri, options)
          yielder << response
          if response.code != 200 || response.parsed_response['meta']['next'].blank?
            break
          end
          query[:_offset] += 100
        end
      end
    end
  end
end
