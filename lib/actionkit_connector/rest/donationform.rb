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

module ActionKitConnector
  module REST
    module PageFollowUp

      def create_page_follow_up(data)
        self.class.post('/pagefollowup/', prep_options(data))
      end
    end
  end
end

