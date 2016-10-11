require 'spec_helper'

describe ActionKitConnector::REST::PetitionAction do
  describe "#update_petition_action" do
    it "responds successfully" do
      VCR.use_cassette "update_petition_action" do
        params = {
          page: "/rest/v1/petitionpage/16483/",
          name: "Help me"
        }
        response = client.update_petition_action("61821024", params)
        expect(response.success?).to be_truthy
      end
    end
  end
end
