require_relative './spec_helper'

describe Cache::Backend::IronCache do
  before do
    @ironcache = IronCache::Client.new(project_id: IRON_CACHE_PROJECT_ID, token: IRON_CACHE_TOKEN).cache("tests")
    @client = Cache::Client.new(Cache::Backend::IronCache, IRON_CACHE_PROJECT_ID, IRON_CACHE_TOKEN, 'tests')
  end

  it "works" do
    begin
      @ironcache.delete('a-key')
    rescue Rest::HttpError
      # that's ok
    end
    @client.get('a-key').must_be_nil
    @client.set('a-key', 'some info')
    @client.get('a-key').must_equal('some info')

    @ironcache.get('a-key').value.must_equal(JSON.dump("value" => "some info"))
  end

  it "can set keys to nil" do
    @client.set('a-key', 'some info')
    @client.get('a-key').wont_be_nil
    @client.set('a-key', nil)
    @client.get('a-key').must_be_nil
  end

  it "works with hashes" do
    @client.set('a-key', '')
    @client.set('a-key', {'bla' => 'blub', 'hallo' => 123.4})
    @client.get('a-key').must_equal({'bla' => 'blub', 'hallo' => 123.4})
  end

  it "works with numbers" do
    @client.set('a-key', 34.546)
    @client.get('a-key').must_equal(34.546)
  end
end