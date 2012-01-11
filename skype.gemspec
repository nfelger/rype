# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.version     = "0.0.1"
  s.name        = "skype"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Niko Felger"]
  s.email       = ["niko.felger@gmail.com"]
  s.homepage    = "https://github.com/nfelger/skype"
  s.summary     = %q{Unofficial Skype Api wrapper}
  s.description = %q{Unofficial Skype Api wrapper}

  s.rubyforge_project = "skype"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.has_rdoc      = false
  s.rubygems_version = %q{1.3.7}
  s.add_dependency("ruby-dbus", [">= 0.6"])
  s.add_development_dependency("rspec")
end
