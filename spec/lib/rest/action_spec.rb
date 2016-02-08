require 'spec_helper'

describe ActionKitConnector::REST::Action do
  describe '#create_action' do

    let(:data) do

      {
        name:         "Pablo José Francisco de María",
        postal:       "W1",
        address1:     "The Lodge",
        address2:     "High Street",
        city:         "London",
        country:      "United Kingdom",
        action_age:   "101",
        action_foo:   "Foo",
        action_bar:   "Bar",
        ignored:      "ignore me",
        page:         "foo-bar",
        email:        "foo+113@example.com"

      }
    end

    it 'returns the created action' do

      VCR.use_cassette('rest_action_200') do
        expected = {
          'created_user' => false,
          'status'       => 'complete',
          'type'         => 'Petition',
          'fields'       => { 'age' => '101', 'bar' => 'Bar', 'foo' => 'Foo' }
        }

        expect( client.create_action(data) ).to include( expected )
      end
    end

    context 'non existent page' do

      it 'returns 400' do
        VCR.use_cassette('rest_action_400') do
          data['page']  = 'i-do-not-exist-xyz-123'
          resp = client.create_action(data)

          expect(resp.response.code).to eq('400')
          expect(resp.parsed_response).to eq({"page"=>"Unable to find a page for processing. You sent page=i-do-not-exist-xyz-123."})
        end
      end
    end
  end
end


