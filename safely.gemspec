# -*- encoding: utf-8 -*-
require File.expand_path('../lib/safely/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kenneth Kalmer"]
  gem.email         = ["kenneth.kalmer@gmail.com"]
  gem.description   = %q{Safely run your code in a loving error reporting embrace}
  gem.summary       = %q{Safely run your code, keep track of exceptions}
  gem.homepage      = "https://github.com/kennethkalmer/safely"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "safely"
  gem.require_paths = ["lib"]
  gem.version       = Safely.version

  gem.add_development_dependency(%q<bundler>)
  gem.add_development_dependency(%q<rake>, ["~> 10.4.2"])
  gem.add_development_dependency(%q<toadhopper>, [">= 0"])
  gem.add_development_dependency(%q<mail>, [">= 0"])
  gem.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
  gem.add_development_dependency(%q<yard>, ["~> 0.8.7"])
  gem.add_development_dependency(%q<mocha>, [">= 0"])
end
