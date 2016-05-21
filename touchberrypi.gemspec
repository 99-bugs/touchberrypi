# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'touchberrypi/version'

Gem::Specification.new do |spec|
  spec.name          = "touchberrypi"
  spec.version       = Touchberrypi::VERSION
  spec.authors       = ["Sille Van Landschoot"]
  spec.email         = ["info@sillevl.be"]

  spec.summary       = %q{Ruby library for using the Touchberry Pi shield}
  spec.description   = %q{Ruby library for using and controlling the Touchberry Pi shield}
  spec.homepage      = "https://github.com/99-bugs/touchberrypi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "pi_piper"
  spec.add_dependency "qt1070"
  spec.add_dependency "tlc59116"
end
