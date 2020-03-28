# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'rake/extensiontask'

RSpec::Core::RakeTask.new(:spec)

Rake::ExtensionTask.new('macsay') do |ext|
  ext.ext_dir = 'ext'
end

RuboCop::RakeTask.new do |task|
  task.options = %w[-c .rubocop.yml]
end

task default: %i[rubocop spec]
task spec: [:compile]
task compile: [:clean]
