module ActionKitConnector
  module REST
    module RecurringPaymentCancellation
      def cancel_subscription(data)
        self.class.post('/profilecancelpush/', prep_options(data))
      end
    end
  end
end
