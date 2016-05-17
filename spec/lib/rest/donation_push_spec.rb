require 'spec_helper'

describe ActionKitConnector::REST::DonationPush do

  describe '#create_donation_action' do
    let(:data) do
      {
        donationpage: {
          name: 'foo-bar-donation',
          payment_account: 'Braintree EUR',
          status: 'pending'
        },
        order: {
          amount:         "1.00",
          card_code:      "007",
          card_num:       "4111111111111111",
          exp_date_month: "12",
          exp_date_year:  "2015",
          currency:       "GBP",
          status:         "failed"
        },
        user: {
          email:      'test@example.com',
          country:    'United Kingdom',
          action_foo: 'Foo',
          ignore:     'ignore this',
          postal:     'W1'
        },
        action: {
          source:     "FB",
          status: 'pending'
        },
        stauts: 'pending'
      }
    end

    describe 'credit card donations' do
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

        it "has Braintree for order account" do
          expect(subject.fetch('account')).to eq('Braintree EUR')
        end
      end
    end

    describe 'paypal donation' do
      before do
        data[:donationpage][:payment_account] = 'PayPal EUR'
      end

      subject(:request) do
        VCR.use_cassette('rest_donation_push_paypal_200') do
          client.create_donation(data)
        end
      end

      it "has credit card for default payment_method" do
        expect(subject['order'].fetch('account')).to eq('PayPal EUR')
      end
    end
  end
end

