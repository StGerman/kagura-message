# frozen_string_literal: true

require_relative 'lib/switchy/version'

Gem::Specification.new do |spec|
  spec.name          = 'switchy-kagura_message'
  spec.version       = Switchy::VERSION
  spec.authors       = ['Stanislav German']
  spec.email         = ['stas.german@gmail.com']

  spec.summary       = 'Message wrapper for serialized and deserialization RFC 822 messages'

  spec.homepage      = "https://github.com/ONLYOFFICE/#{spec.name}"
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.6')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/swupde/switchy-kagura-message'
  spec.metadata['changelog_uri'] = 'https://github.com/swupde/switchy-kagura-message/blob/master/README.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'activesupport', '>= 4.2'
  spec.add_dependency 'dry-validation', '~> 1.5'
end
