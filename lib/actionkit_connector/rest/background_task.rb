module ActionKitConnector
  module REST
    module BackgroundTask
      def get_background_task(id)
        self.class.get("/backgroundtask/#{id}/", prep_options({}))
      end
    end
  end
end
