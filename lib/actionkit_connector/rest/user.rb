module ActionKitConnector
  module REST
    module User
      def update_user(id, data)
        self.class.put("/user/#{id}/", prep_options(data))
      end
    end
  end
end
