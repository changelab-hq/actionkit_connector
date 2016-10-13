require 'spec_helper'

describe ActionKitConnector::REST::RecurringPaymentCancellation do
  describe '#cancel_subcsription' do

    subject(:request) do
      VCR.use_cassette('subscription cancellation success') do
        client.cancel_subscription(recurring_id: '64zrcr')
      end
    end

    it 'cancels the subscription' do
      subject
      #TODO: assertions and such
    end

  end
end

