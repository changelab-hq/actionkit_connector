module ActionKitConnector
  module REST
    module Petitionform

      def create_petitionform(data)
        self.class.post('/petitionform/', prep_options(data))
      end

      def update_petitionform(data)
        self.class.put("/petitionform/#{data.fetch(:id)}/", prep_options(data))
      end
    end
  end
end

