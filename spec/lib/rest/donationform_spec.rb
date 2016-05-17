require 'spec_helper'

describe ActionKitConnector::REST::Donationform do
  describe '#create_donationform' do
    before(:all) { VCR.turn_off! }
    after(:all)  { VCR.turn_on!  }

    subject(:request) do
      client.create_donationform(foo: 'bar')
    end

    before do
      stub_request(:post, "https://DummyUsername:DummyPassword@act.sumofus.org/rest/v1/donationform/")
    end

    it 'creates a new donationform' do
      subject

      expect(WebMock).to have_requested(:post, /https:\/\/.*:.*@act.sumofus.org\/rest\/v1\/donationform\//).
        with(body: {foo: 'bar'})
    end
  end
end

