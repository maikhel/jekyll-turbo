# frozen_string_literal: true

require_relative "lib/jekyll/turbo/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-turbo"
  spec.version = Jekyll::Turbo::VERSION
  spec.authors = ["maikhel"]
  spec.email = ["mlecicki@gmail.com"]

  spec.summary = "A Jekyll plugin that automatically injects Turbo Drive to enable faster," \
                 "client-side page transitions."
  spec.description = "jekyll-turbo is a plugin for Jekyll that seamlessly integrates Hotwire's " \
                     "Turbo Drive into your static site. It automatically injects the necessary " \
                     "script tag into your HTML output to enable client-side Turbo features, such as " \
                     "Turbo Drive and Turbo Frames."
  spec.homepage = "https://github.com/maikhel/jekyll-turbo/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/maikhel/jekyll-turbo/"
  spec.metadata["changelog_uri"] = "https://github.com/maikhel/jekyll-turbo/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/maikhel/jekyll-turbo/issues"
  spec.metadata["documentation_uri"] = "https://github.com/maikhel/jekyll-turbo#readme"
  spec.metadata["rubygems_mfa_required"] = "true"

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
end
