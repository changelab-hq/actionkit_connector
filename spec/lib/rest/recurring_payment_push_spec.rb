require 'spec_helper'

describe ActionKitConnector::REST::RecurringPaymentPush do
  describe '#create_recurring_payment' do
    before(:all) { VCR.turn_off! }
    after(:all)  { VCR.turn_on!  }

    subject(:request) do
      client.create_recurring_payment(foo: 'bar')
    end

    before do
      stub_request(:post, "https://DummyUsername:DummyPassword@act.sumofus.org/rest/v1/recurringpaymentpush/")
    end

    it 'creates a new donationform' do
      subject

      expect(WebMock).to have_requested(:post, /https:\/\/.*:.*@act.sumofus.org\/rest\/v1\/recurringpaymentpush\//).
        with(body: {foo: 'bar'})
    end
  end
end

