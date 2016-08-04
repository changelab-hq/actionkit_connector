require 'spec_helper'

describe ActionKitConnector::REST::MultilingualCampaign do

  describe "#create_multilingual_campaign" do
    context "given valid params" do
      let(:params) do
        { name: 'AKConnector Test Campaign 2' }
      end

      before do
        VCR.use_cassette("create_multilingual_campaign_201") do
          @response = client.create_multilingual_campaign(params)
        end
      end

      it "returns 201 Created" do
        expect(@response.code).to eq 201
      end

      it "returns the campaign location attribute" do
        expect( @response.headers['location'] ).to match(%r{.+/rest/v1/multilingualcampaign/\d+/})
      end
    end

    context "given invalid params" do
      let(:params) do
        { }
      end

      before do
        VCR.use_cassette("create_multilingual_campaign_400") do
          @response = client.create_multilingual_campaign(params)
        end
      end

      it "returns 400 Bad Request" do
        expect(@response.code).to eq 400
      end

      it "returns an error message" do
        expect(@response.parsed_response.dig('multilingualcampaign', "name")).to include("This field is required.")
      end
    end
  end

  describe "#update_multilingual_campaign" do
    context "given valid params" do
      it "returns a 204 response and updates the campaign" do
        VCR.use_cassette("update_multilingual_campaign_204") do
          response = client.create_multilingual_campaign(name: 'AKConnector Test Campaign 44')
          expect(response.code).to eq 201

          ak_id = ActionKitConnector::Util.extract_id_from_resource_uri(response.headers.fetch('location'))
          response = client.update_multilingual_campaign(ak_id, name: 'AKConnector Test Campaign 4 Updated')
          expect(response.code).to eq 204

          response = client.get_multilingual_campaign(ak_id)
          expect(response.code).to eq 200
          expect(response.parsed_response['name']).to eq 'AKConnector Test Campaign 4 Updated'
        end
      end
    end

    context "given invalid params" do
      it "returns a 400 response with the error message" do
        VCR.use_cassette("update_multilingual_campaign_400", record: :new_episodes) do
          response = client.create_multilingual_campaign(name: 'AKConnector Test Campaign 5')
          expect(response.code).to eq 201

          ak_id = ActionKitConnector::Util.extract_id_from_resource_uri(response.headers.fetch('location'))
          response = client.update_multilingual_campaign(ak_id, name: '')
          expect(response.code).to eq 400
          expect(response.parsed_response.dig('multilingualcampaign', "name")).to include("This field is required.")
        end
      end
    end
  end
end
