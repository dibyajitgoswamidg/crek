
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crek/version"

Gem::Specification.new do |spec|
  spec.name          = "crek"
  spec.version       = Crek::VERSION
  spec.authors       = ["Dibyajit"]
  spec.email         = ["dibyajit.g@treniq.com"]

  spec.summary       = %q{Creek with image read from xlsx feature for Creek 1.1.2.}
  spec.description   = %q{Creek with image read from xlsx feature for Creek 1.1.2.}
  spec.homepage      = "https://github.com/dibyajitgoswamidg/crek"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.9.2'

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency 'rspec', '~> 2.13.0'
  s.add_development_dependency 'pry'

  s.add_dependency 'nokogiri', '~> 1.6.0'
  s.add_dependency 'rubyzip', '>= 1.0.0'
end
