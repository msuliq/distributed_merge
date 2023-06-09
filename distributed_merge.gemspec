# frozen_string_literal: true

require_relative "lib/distributed_merge/version"

Gem::Specification.new do |spec|
  spec.name = "distributed_merge"
  spec.version = DistributedMerge::VERSION
  spec.authors = ["msuliq"]
  spec.email = ["slmusayev@gmail.com"]

  spec.summary = "Gem that adds the method to merge arrays of unequal size with
   distribution of elements."
  spec.description = "This gem extends Array class with the distributed_merge method that
   accepts a two-dimensional array containing an arbitrary number of arrays of varying
   length and returns a one-dimensional merged array with the elements equally interleaved
   and distributed."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"
  spec.homepage = "https://github.com/msuliq/distributed_merge"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/msuliq/distributed_merge"
  spec.metadata["changelog_uri"] = "https://github.com/msuliq/distributed_merge/blob/main/CHANGELOG.md"

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
