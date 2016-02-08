module ActionKitConnector
  module REST
    module DonationPush

      def create_donation(data)
        self.class.post('/donationpush/', prep_options(data))
      end
    end
  end
end
