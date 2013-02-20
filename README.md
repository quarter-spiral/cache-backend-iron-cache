# Cache::Backend::IronCache

An Iron Cache backend for the Quarter Spiral ``cache-client`` gem.

## Setup

Require this gem and the ``cache-client`` gem e.g. in your Gemfile:

```ruby
gem 'cache-client'
gem 'cache-backend-iron-cache'
```

Then use it like this:

```ruby
cache_client = Cache::Client.new(Cache::Backend::IronCache, 'IRON_CACHE_PROJECT_ID', 'IRON_CACHE_TOKEN', 'CACHE_NAME', more_iron_cache_client_options)
```
``more_iron_cache_client_options`` is a hash and can be omitted. When set it will be directly sent to the [Iron Cache client](https://github.com/iron-io/iron_cache_ruby/blob/master/lib/iron_cache/client.rb)

## Testing

Tests need a connection to the internet and you must set two environment variables with your Iron Cache project id and token: ``TEST_IRON_CACHE_PROJECT_ID`` and ``TEST_IRON_CACHE_TOKEN``.