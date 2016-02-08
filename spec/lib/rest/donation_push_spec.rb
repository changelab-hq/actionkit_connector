require 'spec_helper'

describe ActionKitConnector::REST::Action do

  describe '#create_donation_action' do
    let(:data) do
      {
        donationpage: {
          name: 'foo-bar-donation',
          payment_account: 'Default Import Stub'
        },
        order: {
          amount:         "34.00",
          card_code:      "007",
          card_num:       "4111111111111111",
          exp_date_month: "12",
          exp_date_year:  "2015",
          currency:       "GBP"
        },
        user: {
          email: 'foo+100@example.com',
          country: 'Portugal'
        }
      }
    end

    subject(:request) do
      VCR.use_cassette('rest_donation_push_200') do
        client.create_donation(data)
      end
    end

    it "registers as complete" do
      expect(subject.fetch('status')).to eq("complete")
    end

    it "registers type of action" do
      expect(subject.fetch('type')).to eq("Donation")
    end

    describe "recorded order" do
      subject { request.fetch('order') }

      it "has correct donation total" do
        expect(subject.fetch('total')).to eq('34.00')
      end

      it "has currency" do
        expect(subject.fetch('currency')).to eq('GBP')
      end

      it "has total as USD" do
        expect( Float(subject.fetch('total_converted')) ).to be > 34.00
      end

      it "has credit card for default payment_method" do
        expect(subject.fetch('payment_method')).to eq('cc')
      end
    end
  end
end
