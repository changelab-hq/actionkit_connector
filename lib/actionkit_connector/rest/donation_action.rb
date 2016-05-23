module ActionKitConnector
  module REST
    module DonationAction

      def get_donation_action(data)
        self.class.delete('/donationaction/', prep_options(data))
      end

      def delete_donation_action(data)
        self.class.delete('/donationaction/', prep_options(data))
      end
    end
  end
end

