module ActionKitConnector
  module Util
    class << self
      def extract_id_from_resource_uri(uri)
        match = uri.match id_regex_for_resource
        match[1] if match
      end

      private

      def id_regex_for_resource
        /\/(\d+)\/?\z/
      end
    end
  end
end
