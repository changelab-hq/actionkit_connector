module ActionKitConnector
  module REST
    module Page
      def create_petition_page(data)
        self.class.post('/petitionpage/', prep_options(data))
      end

      def update_petition_page(data)
        self.class.patch("/petitionpage/#{data.fetch(:id)}/", prep_options(data))
      end

      def create_donation_page(data)
        self.class.post('/donationpage/', prep_options(data))
      end

      def update_donation_page(data)
        self.class.patch("/donationpage/#{data.fetch(:id)}/", prep_options(data))
      end
    end
  end
end

