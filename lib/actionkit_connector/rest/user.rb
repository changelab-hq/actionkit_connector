module ActionKitConnector
  module REST
    module User

      def update_user(data)
        self.class.post('/user/', prep_options(data))
      end
    end
  end
end
