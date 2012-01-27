require 'dbus'
require 'forwardable'

module Rype
  class Api
    class << self
      extend Forwardable
      def_delegators :instance, :attach, :invoke, :on_notification, :notify, :thread

      def instance
        @instance ||= new
      end
    end

    attr_reader :thread

    def attach(application_name="rype")
      raise "Already attached." if attached?

      @application_name = application_name

      # Say hi to Skype.
      status, = api.Invoke "NAME #{@application_name}"

      if status == 'CONNSTATUS OFFLINE'
        raise Rype::Offline
      elsif status != 'OK'
        raise Rype::Denied
      end

      api.Invoke "PROTOCOL 7"

      run_notification_thread
    end

    def invoke(message, &block)
      raise "Not attached to Skype. Call Rype::Api.attach first." unless attached?

      log_outgoing message
      if block_given?
        api.Invoke(message) do |headers, answer|
          log_incoming answer
          block.call(answer)
        end
      else
        answer = api.Invoke(message) do |_, _|
          # Huh? Without passing in a block, sometimes it hangs...??
        end
        log_incoming answer
        answer
      end
    end

    def on_notification(scope, proc=nil, &block)
      raise "Need to register callbacks before attaching to Skype." if attached?

      callbacks[scope] ||= []
      callbacks[scope] << (proc ? proc : block)
    end

    def notify(message)
      log_incoming message

      callbacks.keys.each do |key|
        next unless match = Regexp.new("^#{key}").match(message)
        callbacks[key].each{ |callback| callback.call(*match.captures) }
      end
    end

  private

    def initialize
      # 'pu'a says no.
    end

    def attached?
      thread and thread.alive?
    end

    def api
      @api ||= begin
        skype_service = bus.service("com.Skype.API")
        skype_object  = skype_service.object('/com/Skype')
        skype_object.introspect
        skype_object["com.Skype.API"]
      end
    end

    def run_notification_thread
      @thread ||= Thread.new do
        callback_interface = Class.new(DBus::Object) do
          dbus_interface "com.Skype.API.Client" do
            dbus_method :Notify, "in data:s" do |message|
              Api.notify(message)
            end
          end
        end

        receiving_service_name = "com.nikofelger.rype-#{@application_name.gsub(/[^A-Za-z0-9-]/, '-')}-#{Process.pid}"
        receiving_service = bus.request_service(receiving_service_name)
        receiving_service.export(Notify.new("/com/Skype/Client"))
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
    
    def log_incoming(message)
      STDERR.puts "<- #{message}"
    end
 
    def log_outgoing(message)
      STDERR.puts "-> #{message}"
    end
  end
end
