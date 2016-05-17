module ActionKitConnector
  module REST
    module RecurringPaymentPush

      def create_recurring_payment(data)
        self.class.post('/recurringpaymentpush/', prep_options(data))
      end
    end
  end
end
