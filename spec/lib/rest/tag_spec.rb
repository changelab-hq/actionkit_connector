require 'spec_helper'

describe ActionKitConnector::REST::Tag do
  describe "#list_tags" do
    it "returns the list of languages" do
      VCR.use_cassette "list_tags" do
        response = client.list_tags
        expect(response.code).to eql(200)

        first_tag_name = response.parsed_response['objects'].first['name']
        expect(first_tag_name).to eql "ControlShift"
      end
    end
  end
end
