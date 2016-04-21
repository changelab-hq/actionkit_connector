module ActionKitConnector
  module REST
    module Order

      def update_order(data, id)
        self.class.patch("/order/#{id}/", prep_options(data))
      end
    end
  end
end
