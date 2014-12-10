#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new

begin
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task :default => [ :spec, 'coveralls:push'  ]
rescue LoadError
end
