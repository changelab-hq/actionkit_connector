require 'spec_helper'

describe ActionKitConnector::Client do
  subject do
    ActionKitConnector::Client.new do |c|
      c.username = "foo"
      c.password = "bar"
      c.host     = "http://example.com"
    end
  end

  describe '#creditions' do
    it 'returns credentials' do
      expect(subject.credentials).to eq({username: 'foo', password: 'bar'})
    end
  end

  describe '#prep_options' do
    it 'wraps auth with data' do
      expected = {
        basic_auth: { username: 'foo', password: 'bar'},
        body: "{\"name\":\"bob\"}"
      }

      expect(subject.prep_options({name: 'bob'})).to eq(expected)
    end
  end

  describe '#base_uri' do
    it 'appends host with REST API path' do
      expect(subject.base_uri).to eq("http://example.com/rest/v1/")
    end
  end
end

