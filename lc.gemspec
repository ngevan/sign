# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lc/version"

Gem::Specification.new do |spec|
  spec.name          = "lc"
  spec.version       = Lc::VERSION
  spec.authors       = ["Evan Ng"]
  spec.email         = ["contact@evanng.com"]

  spec.summary       = %q{Generate a license for your project right from your command-line.}
  spec.description   = %q{A command-line tool that generates a license of your choice in a matter of seconds.}
  spec.homepage      = "https://github.com/evanscloud/lc"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
