module ActionKitConnector
  module REST
    module PageFollowUp
      def create_page_follow_up(data)
        self.class.post('/pagefollowup/', prep_options(data))
      end

      def update_page_follow_up(id, data)
        self.class.put("/pagefollowup/#{id}/", prep_options(data))
      end
    end
  end
end
