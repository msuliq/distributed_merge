# frozen_string_literal: true

require_relative "lib/distributed_merge/version"

Gem::Specification.new do |spec|
  spec.name = "distributed_merge"
  spec.version = DistributedMerge::VERSION
  spec.authors = ["Suleyman Musayev"]
  spec.email = ["slmusayev@gmail.com"]

  spec.summary = "Merge arbitrary number of arrays into one with equal distribution of
    elements."
  spec.description = "This gem extends standard Ruby library with distributed_merge method
   that takes in an arbitrary number of arrays and produces one merged array with
   the elements equally distributed in the merged result."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.homepage = "https://github.com/msuliq/distributed_merge"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/msuliq/distributed_merge"
  spec.metadata["changelog_uri"] = "https://github.com/msuliq/distributed_merge/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end