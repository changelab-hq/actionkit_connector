module ActionKitConnector
  module REST
    module Action

      def create_action(data)
        self.class.post('/action/', prep_options(data))
      end
    end
  end
end
