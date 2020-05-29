# frozen_string_literal: true

require_relative 'lib/sepa_reason_codes/version'

Gem::Specification.new do |spec|
  spec.name          = 'sepa_reason_codes'
  spec.version       = SepaReasonCodes::VERSION
  spec.authors       = ['Sahil Gadimbayli']
  spec.email         = ['hi@ramblingcode.dev']

  spec.summary       = 'Minimal, plain old ruby gem to work with Sepa Reason Codes.'
  spec.homepage      = 'https://github.com/ramblingcode/sepa-reason-codes'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ramblingcode/sepa-reason-codes'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
