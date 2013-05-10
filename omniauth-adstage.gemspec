# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-adstage/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-adstage"
  gem.version       = Omniauth::Adstage::VERSION
  gem.authors       = ["David Haslem"]
  gem.email         = ["therabidbanana@gmail.com"]
  gem.description   = %q{Omniauth provider for adstage}
  gem.summary       = %q{Omniauth provider for adstage}
  gem.homepage      = "https://www.adstaage.io"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
