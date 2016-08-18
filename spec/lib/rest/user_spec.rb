require 'spec_helper'

describe ActionKitConnector::REST::User do
  describe '#update_user' do

    let(:params) {{
        akid: '8244194',
        email: 'totallynewemail@example.com',
        first_name: 'testy',
        last_name: 'test',
        country: 'United States',
        city: 'San Francisco',
        postal: '94103',
        address1: 'Jam Factory 123',
        address2: 'Random address'
    }}

    context 'with valid parameters' do
      it 'updates the user on ActionKit and returns no content' do
        VCR.use_cassette('rest_user_success') do
          resp = client.update_user(params[:akid], params)
          expect(resp.response.class).to eq Net::HTTPNoContent
        end
      end
    end
  end
end

