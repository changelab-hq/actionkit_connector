require 'spec_helper'

describe ActionKitConnector::REST::Language do
  describe "#list_languages" do
    it "returns the list of languages" do
      VCR.use_cassette "list_languages" do
        response = client.list_languages
        expect(response.code).to eql(200)

        language_names = response.parsed_response['objects'].map { |o| o['name'] }
        expect(language_names).to include 'English'
      end
    end
  end
end
