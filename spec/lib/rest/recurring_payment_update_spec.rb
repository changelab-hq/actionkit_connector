require 'spec_helper'

describe ActionKitConnector::REST::RecurringPaymentUpdate do
  describe 'update recurring payment' do

    subject(:request) do
      VCR.use_cassette('subscription update success') do
        @response=client.update_recurring_payment(recurring_id: '5b33x6', amount: 7)
      end
    end

    it 'gets a success code back' do
      subject
      expect(@response.code).to eq(201)
    end

  end
end

