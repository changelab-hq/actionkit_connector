require 'spec_helper'

describe ActionKitConnector::REST::Petitionform do
  describe '#create_petitionform' do
    before(:all) { VCR.turn_off! }
    after(:all)  { VCR.turn_on!  }

    subject(:request) do
      client.create_petitionform(foo: 'bar')
    end

    before do
      stub_request(:post, "https://DummyUsername:DummyPassword@act.sumofus.org/rest/v1/petitionform/")
    end

    it 'creates a new petitionform' do
      subject

      expect(WebMock).to have_requested(:post, /https:\/\/.*:.*@act.sumofus.org\/rest\/v1\/petitionform\//).
        with(body: {foo: 'bar'})
    end
  end
end
