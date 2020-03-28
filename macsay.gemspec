# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'macsay'
  spec.version       = '0.1.1'
  spec.authors       = ['winebarrel']
  spec.email         = ['sugawara@winebarrel.jp']

  spec.summary       = 'Simple Ruby bindings for NSSpeechSynthesizer.'
  spec.description   = 'Simple Ruby bindings for NSSpeechSynthesizer.'
  spec.homepage      = 'https://github.com/winebarrel/macsay'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib ext]
  spec.extensions    = 'ext/extconf.rb'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
