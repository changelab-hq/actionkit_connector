module ActionKitConnector
  module REST
    module Action

      def create_action(data)
        self.class.post('/action/', prep_options(data))
      end

      def delete_action(id)
        self.class.delete("/action/#{id}/", prep_options({}))
      end
    end
  end
end
