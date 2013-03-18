require 'spec_helper'

describe "OSVDB API" do
  let(:api_key) { '0xFAKExAPIxKEYx0' }

  it "finds a record by OSVDB's General Search" do
    # ahh, irony!
    query = 'dradis'

    stub_request(:get, "http://osvdb.org/api/vulns_by_custom_search/#{api_key}/?request=#{query}&order=osvdb_id").
      to_return(:status => 200,
        :body => File.read("spec/fixtures/files/osvdb_general_#{query}.xml"),
        :headers => {'Content-Type' => 'application/xml; charset=utf-8'})

    results = Dradis::Plugins::OSVDB::API.by_custom_query(:api_key => api_key, :query => query)
    results.count.should eq(2)

    results.each do |result|
      result.keys.should include('title')
      result.keys.should include('osvdb_id')
    end

    results[0]['title'].should eq('dradis XML File Upload XSS')
    results[0]['osvdb_id'].should eq(64730)
    results[1]['title'].should eq('dradis Unspecified Issue')
    results[1]['osvdb_id'].should eq(53319)
  end


  it "finds a record by OSVDB ID" do
    osvdb_id = 1234

    stub_request(:get, "http://osvdb.org/api/find_by_osvdb/#{api_key}/#{osvdb_id}").
      to_return(:status => 200,
        :body => File.read("spec/fixtures/files/osvdbid_#{osvdb_id}.xml"),
        :headers => {'Content-Type' => 'application/xml; charset=utf-8'})

    results = Dradis::Plugins::OSVDB::API.by_osvdbid(:api_key => api_key, :osvdb_id => osvdb_id)
    results.count.should eq(1)

    results[0].keys.should include('title')
    results[0].keys.should include('osvdb_id')

    results[0]['title'].should eq('Lynx URL Handling Remote Overflow')
    results[0]['osvdb_id'].should eq(osvdb_id)
  end
end
