module ActionKitConnector
  module REST
    module MultilingualCampaign
      def create_multilingual_campaign(data)
        self.class.post('/multilingualcampaign/', prep_options(data))
      end

      def update_multilingual_campaign(id, data)
        self.class.put("/multilingualcampaign/#{id}/", prep_options(data))
      end

      def get_multilingual_campaign(id)
        self.class.get("/multilingualcampaign/#{id}/", prep_options({}))
      end
    end
  end
end
