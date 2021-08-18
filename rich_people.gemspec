# frozen_string_literal: true

require_relative "lib/rich_people/version"

Gem::Specification.new do |spec|
  spec.name          = "rich_people"
  spec.version       = RichPeople::VERSION
  spec.authors       = ["ppidcard"]
  spec.email         = ["tvxqlikei@live.cn"]

  spec.summary       = "Top 100 Rich People CLI App"
  spec.description   = "Scraping details regarding top 100 rich people in the world"
  spec.homepage      = "https://github.com/ppidcard/ruby-project"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ppidcard/ruby-project"
  spec.metadata["changelog_uri"] = "https://github.com/ppidcard/ruby-project/CHANGELOG.md."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "bin"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "nokogiri"
  spec.add_dependency "open-uri"
  spec.add_dependency "awesome_print"
  spec.add_dependency "ruby-progressbar"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
