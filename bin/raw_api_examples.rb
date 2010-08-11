require 'rubygems'
require 'dbus'

bus              = DBus::SessionBus.instance
skype_service    = bus.service("com.Skype.API")
client_to_skype  = skype_service.object('/com/Skype')
client_to_skype.introspect
api              = client_to_skype["com.Skype.API"]

application_name = "ruby-skype"

# Say hi to Skype.
api.Invoke("NAME #{application_name}")
api.Invoke("PROTOCOL 7")

# Send a message.
test_chat = 'enteryourchatidhere'
api.Invoke("CHATMESSAGE #{test_chat} hi there.")

# Register service for notifications from skype.
Thread.new do 
  class Notify < DBus::Object
    dbus_interface "com.Skype.API.Client" do
      dbus_method :Notify, "in data:s" do |args|
        puts args
      end
    end
  end

  bus = DBus::SessionBus.instance
  receiver_service = bus.request_service("com.nikofelger.ruby-skype")
  receiver_service.export(Notify.new("/com/Skype/Client"))
  dbus_event_loop = DBus::Main.new
  dbus_event_loop << bus
  dbus_event_loop.run
end
begin
  sleep
rescue Interrupt
  puts "Exiting"
end
