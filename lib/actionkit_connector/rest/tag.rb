module ActionKitConnector
  module REST
    module Tag
      def list_tags(page:false)
        if page
          pager_for("/tag")
        else
          self.class.get("/tag", prep_options({}).merge(query: { _limit: 100 }))
        end
      end
    end
  end
end
