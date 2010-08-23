skype -- Library to talk to the Skype API
====================================

## DESCRIPTION

This library is a simple wrapper for Skype's Linux dbus-based API.

Currently, it has the following capabilities:

* Get a list of your chats
* Send chat messages
* Receive chat messages
* Use the raw Skype protocol via Skype::Api#invoke and Skype::Api#on_notification. More information about the protocol at [developer.skype.com](http://developer.skype.com)


## INSTALLATION

In order to work with the skype gem, there are a few requirements:

- You need to be on Linux
- You need Skype running
- You need dbus installed (e.g., via apt on Ubuntu)
- You need the ruby-dbus gem:
  - wget http://github.com/downloads/mvidner/ruby-dbus/ruby-dbus-0.3.1.tgz
  - tar xzf ruby-dbus-0.3.1.tgz
  - cd ruby-dbus-0.3.1
  - follow the instructions in README
- You may want Xvfb (if you want to run Skype head-less)


## RUNNING

To confirm it's working, start skype and sign in. Open an irb session and:

    require 'dbus'
    bus = DBus::SessionBus.instance
    skype_service = bus.service("com.Skype.API")
    client_to_skype = skype_service.object('/com/Skype')
    client_to_skype.introspect
    api = client_to_skype["com.Skype.API"]
    api.Invoke("NAME ruby-skype")

Skype will now ask whether "ruby-skype" should be allowed to connect.


## USAGE

There are a few examples in `examples/` that should give you some idea of how 
to use the gem.


## HEAD-LESS SKYPE

Say you want to be running an app that connects to skype on a box that won't have a display attached. Luckily, there's Xvfb:

  "Xvfb or X virtual framebuffer is an X11 server that performs all graphical operations in memory, not showing any screen output." (wikipedia)"

In `bin/start_skype`, there's a simple script to start Skype using Xvfb.

You can safely ignore warnings about missing fonts, but if they bother you, try:

  sudo aptitude install xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic


## SMALL PRINT

This product uses the Skype API but is not endorsed, certified or otherwise
approved in any way by Skype.
