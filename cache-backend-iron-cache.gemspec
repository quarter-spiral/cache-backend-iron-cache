# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cache-backend-iron-cache/version'

Gem::Specification.new do |gem|
  gem.name          = "cache-backend-iron-cache"
  gem.version       = Cache::Backend::IronCache::VERSION
  gem.authors       = ["Thorben Schröder"]
  gem.email         = ["stillepost@gmail.com"]
  gem.description   = %q{An Iron Cache backend for the Quarter Spiral cache-client gem.}
  gem.summary       = %q{An Iron Cache backend for the Quarter Spiral cache-client gem.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'iron_cache', '1.4.0'
  gem.add_dependency 'json', '~> 1.7.7'
end
