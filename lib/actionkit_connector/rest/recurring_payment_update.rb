module ActionKitConnector
  module REST
    module RecurringPaymentUpdate

      def update_recurring_payment(data)
        self.class.post('/profileupdatepush/', prep_options(data))
      end
    end
  end
end
