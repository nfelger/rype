require 'skype/chat'
require 'dbus'
require 'forwardable'

module Skype
  class Api
    class << self
      extend Forwardable
      def_delegators :instance, :attach, :invoke, :on_notification, :notify

      def instance
        @instance ||= new
      end
    end

    def attach(application_name="ruby-skype")
      raise "Already attached." if @attached

      # Say hi to Skype.
      invoke "NAME #{application_name}"
      invoke "PROTOCOL 7"

      run_notification_thread

      @attached = true
    end

    def invoke(message)
      raise "Not attached to skype. Call Skype::Api.attach first." unless @attached

      api.Invoke(message)
    end

    def on_notification(scope, proc=nil, &block)
      raise "Need to register callbacks before attaching to Skype." if @attached

      callbacks[scope] ||= []
      callbacks[scope] << (proc ? proc : block)
    end

    def notify(message)
      callbacks.keys.each do |key|
        next unless message =~ Regexp.new("^#{key}")
        callbacks[key].each{ |callback| callback.call(message) }
      end
    end

    private

    def api
      @api ||= begin
        skype_service    = bus.service("com.Skype.API")
        skype_object  = skype_service.object('/com/Skype')
        skype_object.introspect
        skype_object["com.Skype.API"]
      end
    end

    def run_notification_thread
      Thread.new do
        receiver_service = bus.request_service("com.nikofelger.ruby-skype")
        receiver_service.export(Notify.new("/com/Skype/Client"))
        dbus_event_loop = DBus::Main.new
        dbus_event_loop << bus
        dbus_event_loop.run
      end
    end

    def bus
      DBus::SessionBus.instance
    end

    def callbacks
      @callback ||= {}
    end

    def initialize
    end
  end

  class Notify < DBus::Object
    dbus_interface "com.Skype.API.Client" do
      dbus_method :Notify, "in data:s" do |message|
        Api.notify(message)
      end
    end
  end
end
