require 'spec_helper'

describe ActionKitConnector::REST::Order do
  describe '#update_order' do
    it 'updates' do
      VCR.use_cassette('rest_order_put_200') do
        expect( client.update_order({import_id: 'null', currency: 'EUR', status: 'pending'}, 855473).code ).to eq(202)
      end
    end
  end
end
