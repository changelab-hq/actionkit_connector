require 'spec_helper'

describe ActionKitConnector::REST::Page do
  describe '#create_petition_page' do
    let(:data) do
      {
        name:     "foo-bar-test-abcd-petition",
        title:    "Foo Bar"
      }
    end

    context 'valid request' do
      subject do
        VCR.use_cassette('rest_petition_page_200') do
          client.create_petition_page(data)
        end
      end

      it 'returns location of page' do
        expect( subject.headers.fetch('location' ) ).to match(%r{.+/rest/v1/petitionpage/\d+/})
      end
    end

    context 'invalid request' do
      subject do
        VCR.use_cassette('rest_petition_page_400') do
          client.create_petition_page(data)
        end
      end

      before do
        data[:name] = "}invalid-name{"
      end

      it 'returns error message' do
        expect(subject.parsed_response.fetch("petitionpage") ).to include({"name" => ["Enter a valid 'slug' consisting of letters, numbers, underscores or hyphens."]})
      end

      it 'returns 400' do
        expect(subject.response.code).to eq("400")
      end
    end
  end

  describe '#update_petition_page' do
    let(:data) do
      {
        tags:     ["/rest/v1/tag/1405/", "/rest/v1/tag/518/"],
        id:       "11319"
      }
    end

    context 'valid request' do
      subject do
        VCR.use_cassette('rest_patch_petition_page_202') do
          client.update_petition_page(data)
        end
      end

      it 'returns 202' do
        expect(subject.response.code).to eq("202")
      end
    end

    context 'invalid request' do
      subject do
        VCR.use_cassette('rest_patch_petition_page_404') do
          client.update_petition_page(data)
        end
      end

      before do
        data[:id] = "99999999999" # No page with this ID exists
      end

      it 'returns 404' do
        expect(subject.response.code).to eq("404")
      end
    end
  end

  describe '#create_donation_page' do
    let(:data) do
      {
        name:     "foo-bar-test-abcd-donation",
        title:    "Foo Bar"
      }
    end

    context 'valid request' do
      subject do
        VCR.use_cassette('rest_donation_page_200') do
          client.create_donation_page(data)
        end
      end

      it 'returns location of page' do
        expect( subject.headers.fetch('location' ) ).to match(%r{.+/rest/v1/donationpage/\d+/})
      end
    end

    context 'invalid request' do
      subject do
        VCR.use_cassette('rest_donation_page_400') do
          client.create_donation_page(data)
        end
      end

      before do
        data[:name] = "}invalid-name{"
      end

      it 'returns error message' do
        expect(subject.parsed_response.fetch("donationpage") ).to include({"name" => ["Enter a valid 'slug' consisting of letters, numbers, underscores or hyphens."]})
      end

      it 'returns 400' do
        expect(subject.response.code).to eq("400")
      end
    end
  end

  describe '#update_donation_page' do
    let(:data) do
      {
        tags:     ["/rest/v1/tag/1405/", "/rest/v1/tag/518/"],
        id:       "11320"
      }
    end

    context 'valid request' do
      subject do
        VCR.use_cassette('rest_patch_donation_page_202') do
          client.update_donation_page(data)
        end
      end

      it 'returns 202' do
        expect(subject.response.code).to eq('202')
      end
    end

    context 'invalid request' do
      subject do
        VCR.use_cassette('rest_patch_donation_page_404') do
          client.update_donation_page(data)
        end
      end

      before do
        data[:id] = "99999999999" # No page with this ID exists
      end

      it 'returns 404' do
        expect(subject.response.code).to eq('404')
      end
    end
  end
end
