module ActionKitConnector
  module REST
    module DonationAction

      def get_donation_action(id)
        self.class.get("/donationaction/#{id}", basic_auth)
      end

      def delete_donation_action(id)
        self.class.delete("/donationaction/#{id}/", basic_auth)
      end
    end
  end
end

