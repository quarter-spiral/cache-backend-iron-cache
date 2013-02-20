Bundler.require

require 'minitest/autorun'

IRON_CACHE_PROJECT_ID = ENV['TEST_IRON_CACHE_PROJECT_ID']
IRON_CACHE_TOKEN = ENV['TEST_IRON_CACHE_TOKEN']

raise "Please set the TEST_IRON_CACHE_PROJECT_ID and TEST_IRON_CACHE_TOKEN environment variables in order to run the tests!" unless IRON_CACHE_PROJECT_ID && IRON_CACHE_TOKEN

require 'cache-client'
require 'cache-backend-iron-cache'