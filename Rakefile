#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cane/rake_task'

desc 'Default: run specs.'
task default: :spec

desc 'Run cane to check quality metrics'
Cane::RakeTask.new :quality do |cane|
  cane.abc_max = 10
  cane.no_style = true
end

RSpec::Core::RakeTask.new
