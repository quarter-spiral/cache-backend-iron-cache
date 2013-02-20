require 'iron_cache'
require 'json'

require "cache-backend-iron-cache/version"

module Cache
  module Backend
    class IronCache
      def initialize(project_id, token, cache, options = {})
        options = {project_id: project_id, token: token}.merge(options)
        @client = ::IronCache::Client.new(options).cache(cache)
      end

      def get(key)
        value = @client.get(key)
        return unless value
        JSON.parse(value.value)['value']
      end

      def set(key, value)
        @client.put(key, JSON.dump({value: value}))
      end
    end
  end
end
