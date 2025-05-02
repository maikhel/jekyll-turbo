# frozen_string_literal: true

require_relative "lib/jekyll/turbo/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-turbo"
  spec.version = Jekyll::Turbo::VERSION
  spec.authors = ["maikhel"]
  spec.email = ["mlecicki@gmail.com"]

  spec.summary = "Simple Jekyll wrapper for Hotwire Turbo library"
  spec.description = "Longer description of my gem"
  spec.homepage = "https://maikhel.github.io/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://maikhel.github.io/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://maikhel.github.io/"
  spec.metadata["changelog_uri"] = "https://maikhel.github.io/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.7", "< 5.0"

  spec.add_development_dependency "rubocop", "~> 1.60"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
