module ActionKitConnector
  module REST
    module MultilingualCampaign
      def create_multilingual_campaign(data)
        self.class.post('/multilingualcampaign/', prep_options(data))
      end
    end
  end
end
