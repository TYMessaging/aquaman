lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aquaman/version'

Gem::Specification.new do |spec|
  spec.name          = 'aquaman'
  spec.version       = Aquaman::VERSION
  spec.authors       = ['TrustYou Messaging']
  spec.email         = ['messaging@trustyou.com']
  spec.summary       = 'HTTP abstraction layer for building web API clients'
  spec.homepage      = 'https://github.com/TYMessaging/aquaman'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # NOTE: this server doesn't exist. We use git for gem distribution.
    spec.metadata['allowed_push_host'] = 'https://NNGgimrSs98xD9wsxo31@gem.fury.io/ty-messaging/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '4.2.10'
  spec.add_dependency 'faraday', '~> 0.15.2'
  spec.add_dependency 'typhoeus', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.57.2'
  spec.add_development_dependency 'reek', '~> 4.8', '>= 4.8.2'
  spec.add_development_dependency 'rubocop-airbnb'
  spec.add_development_dependency 'ffaker', '~> 2.9'
  spec.add_development_dependency 'simplecov'
end
