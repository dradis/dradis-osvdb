require 'spec_helper'

describe "OSVDB import filters" do
  it "raises an error if no API key has been set" do
    expect{ Dradis::Plugins::OSVDB::Filters.validate_API_key() }.to raise_error(RuntimeError)

    [
      Dradis::Plugins::OSVDB::Filters::OSVDBIDLookup,
      Dradis::Plugins::OSVDB::Filters::GeneralSearch
    ].each do |filter|
      results = filter::run(:query => '1234')
      assert_equal( 1, results.size, 'Only one result was expected (the error message)')

      assert_equal( 'Error in OSVDB API key', results[0][:title], 'Unknown error when expecting an API key error' )
    end
  end

  # it "finds a record by OSVDB ID" do
  #
  # end
end
