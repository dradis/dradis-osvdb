require 'spec_helper'

describe "OSVDB API" do
  let(:api_key) { '0xFAKExAPIxKEYx0' }

  it "finds a record by OSVDB ID" do
    stub_request(:get, "http://osvdb.org/api/find_by_osvdb/#{api_key}/1234").
      to_return(:status => 200,
        :body => File.read('spec/fixtures/files/osvdbid_1234.xml'),
        :headers => {'Content-Type' => 'application/xml; charset=utf-8'})

    results = Dradis::Plugins::OSVDB::API.by_osvdbid(:api_key => api_key, :id => 1234)
    results.count.should eq(1)

    results[0].keys.should include('title')
    results[0].keys.should include('osvdb_id')

    results[0]['title'].should eq('Lynx URL Handling Remote Overflow')
    results[0]['osvdb_id'].should eq(1234)
  end
end
