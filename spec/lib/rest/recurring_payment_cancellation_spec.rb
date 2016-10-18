require 'spec_helper'

describe ActionKitConnector::REST::RecurringPaymentCancellation do
  describe '#cancel_subcsription' do

    subject(:request) do
      VCR.use_cassette('subscription cancellation success') do
        @response=client.cancel_subscription(recurring_id: '5b33x6', canceled_by: 'user')
      end
    end

    it 'marks the subscription cancelled and gets a success code back' do
      subject
      expect(@response.code).to eq(201)
    end

  end
end

