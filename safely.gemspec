# -*- encoding: utf-8 -*-
require File.expand_path('../lib/safely/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Kenneth Kalmer', 'Guy Boertje']
  gem.email         = ['kenneth.kalmer@gmail.com']
  gem.description   = %q{Safely run your code in a loving error reporting embrace}
  gem.summary       = %q{Safely run your code, keep track of exceptions}
  gem.homepage      = 'https://github.com/kennethkalmer/safely'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'safely'
  gem.require_paths = ['lib']
  gem.version       = Safely.version

  gem.add_development_dependency(%q<bundler>)
  gem.add_development_dependency(%q<rake>)
  gem.add_development_dependency(%q<rollbar>, ['~> 1.2.11'])
  gem.add_development_dependency(%q<rspec>, ['~> 3.1.0'])
end
