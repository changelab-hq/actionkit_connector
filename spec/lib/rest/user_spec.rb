require 'spec_helper'

describe ActionKitConnector::REST::User do
  describe '#update_user' do

    let(:data) {{ email: "test@example.com" }}

    context 'with a valid email address' do
      it 'updates the user on ActionKit' do
        VCR.use_cassette('rest_user_success') do
          expect( client.create_user(data) ).to include( { 'email' => 'test@example.com'} )
        end
      end
    end
  end
end

