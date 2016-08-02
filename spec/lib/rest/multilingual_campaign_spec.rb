require 'spec_helper'

describe ActionKitConnector::REST::MultilingualCampaign do

  describe "#create_campaign" do
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
end
