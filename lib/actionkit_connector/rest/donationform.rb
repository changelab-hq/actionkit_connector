module ActionKitConnector
  module REST
    module Donationform

      def create_donationform(data)
        self.class.post('/donationform/', prep_options(data))
      end

      def update_donationform(data)
        self.class.put("/donationform/#{data.fetch(:id)}/", prep_options(data))
      end
    end
  end
end
