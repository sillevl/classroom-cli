
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "classroom/version"

Gem::Specification.new do |spec|
  spec.name          = "classroom-cli"
  spec.version       = Classroom::VERSION
  spec.authors       = ["Sille Van Landschoot"]
  spec.email         = ["info@sillevl.be"]

  spec.summary       = %q{Toolbox for Github classroom}
  spec.description   = %q{Toolbox for Github classroom.}
  spec.homepage      = "https://github.com/sillevl/classroom-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.executables   = ["classroom"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency('github_api', '~> 0.13.1')
end