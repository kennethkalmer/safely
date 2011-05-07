# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{safely}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kenneth Kalmer"]
  s.date = %q{2011-05-07}
  s.description = %q{Safely run your code in a loving error reporting embrace}
  s.email = %q{kenneth.kalmer@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "CHANGES",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/safely.rb",
    "lib/safely/config.rb",
    "lib/safely/mixin.rb",
    "lib/safely/strategy.rb",
    "lib/safely/strategy/hoptoad.rb",
    "lib/safely/strategy/mail.rb",
    "safely.gemspec",
    "spec/config_spec.rb",
    "spec/safely_spec.rb",
    "spec/spec_helper.rb",
    "spec/strategies/hoptoad_spec.rb",
    "spec/strategies/mail_spec.rb"
  ]
  s.homepage = %q{http://github.com/kennethkalmer/safely}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Safely run your code, keep track of exceptions}
  s.test_files = [
    "spec/config_spec.rb",
    "spec/safely_spec.rb",
    "spec/spec_helper.rb",
    "spec/strategies/hoptoad_spec.rb",
    "spec/strategies/mail_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<toadhopper>, [">= 0"])
      s.add_development_dependency(%q<mail>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<toadhopper>, [">= 0"])
      s.add_dependency(%q<mail>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<toadhopper>, [">= 0"])
    s.add_dependency(%q<mail>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end

