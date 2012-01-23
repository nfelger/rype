require "rubygems"

require "rspec"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'cucumber'
require 'cucumber/rake/task'
Cucumber::Rake::Task.new('features') do |t|
  t.cucumber_opts = %w{--format pretty}
end

task :default => ["spec", "features"]

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|

  # Change these as appropriate
  s.name              = "rype"
  s.version           = "0.0.2"
  s.authors           = ["Niko Felger"]
  s.email             = "niko.felger@gmail.com"
  s.homepage          = "http://github.com/nfelger/rype"
  s.summary           = %q{Unofficial Skype Api wrapper}
  s.description       = %q{Unofficial Skype Api wrapper}

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths     = ["lib"]
  s.has_rdoc          = false

  s.add_dependency("ruby-dbus", [">= 0.6"])

  s.add_development_dependency("rspec")
  s.add_development_dependency("cucumber")
  s.add_development_dependency("rake")
end

require "rubygems/package_task"
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :package => :gemspec

