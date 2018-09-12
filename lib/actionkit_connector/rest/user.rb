module ActionKitConnector
  module REST
    module User
      def get_user(id: nil, email: nil)
        if id
          self.class.get("/user/#{id}/", prep_options({}))
        elsif email
          query = {'email' => email}
          self.class.get("/user/", prep_options({}, { query: query }))['objects'].first
        end
      end

      def update_user(id, data)
        self.class.put("/user/#{id}/", prep_options(data))
      end
    end
  end
end
