*Only sending chats is supported at the moment.*

Requirements
===

- Linux
- Skype
- dbus (via apt on Ubuntu)
- ruby-dbus:
  - wget http://github.com/downloads/mvidner/ruby-dbus/ruby-dbus-0.3.1.tgz
  - tar xzf ruby-dbus-0.3.1.tgz
  - cd ruby-dbus-0.3.1
  - follow the instructions in README
- xvfb (if you want to run Skype head-less)

Verify it's working
===

Start skype and sign in.

Open an irb session and:

    require 'dbus'
    bus = DBus::SessionBus.instance
    skype_service = bus.service("com.Skype.API")
    client_to_skype = skype_service.object('/com/Skype')
    client_to_skype.introspect
    api = client_to_skype["com.Skype.API"]
    api.Invoke("NAME ruby-skype")

Skype should now ask whether "ruby-skype" should be allowed to connect. From here, you're on your own (for now).