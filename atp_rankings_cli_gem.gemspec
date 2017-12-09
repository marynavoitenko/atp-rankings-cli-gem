
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "atp_rankings_cli_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "atp_rankings_cli_gem"
  spec.version       = AtpRankingsCliGem::VERSION
  spec.authors       = ["marynavoitenko"]
  spec.email         = ["maryna.voitenko@gmail.com"]

  spec.summary       = "ATP World Tour Rankings"
  spec.description   = "Provides Top10 of Male Tennis Players and information about their last played tournament."
  spec.homepage      = "https://learn.co"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
