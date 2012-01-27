# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rype"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Niko Felger"]
  s.date = "2012-01-27"
  s.description = "Unofficial Skype Api wrapper"
  s.email = "niko.felger@gmail.com"
  s.files = [".gitignore", ".travis.yml", "Gemfile", "History.txt", "LICENSE", "Rakefile", "examples/chats/echo_server.rb", "examples/chats/list_chats.rb", "examples/chats/send_chat.rb", "examples/start_skype", "features/receive_chatmessage.feature", "features/send_chatmessage.feature", "features/step_definitions/skype_steps.rb", "features/support/env.rb", "features/support/lib/fake_api.rb", "lib/rype.rb", "lib/rype/api.rb", "lib/rype/chat.rb", "lib/rype/chatmessage.rb", "lib/rype/events.rb", "readme.md", "rype.gemspec", "spec/lib/rype/chat_spec.rb", "spec/lib/rype_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/nfelger/rype"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Unofficial Skype Api wrapper"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-dbus>, [">= 0.6"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<ruby-dbus>, [">= 0.6"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby-dbus>, [">= 0.6"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
