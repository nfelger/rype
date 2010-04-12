require 'skype/chat'
require 'dbus'
require 'forwardable'

module Skype
  class Api
    class << self
      extend Forwardable
      def_delegators :instance, :attach, :invoke

      def instance
        @instance ||= new
      end
    end

    def attach(application_name="ruby-skype")
      raise "Already attached!" if @attached

      # Say hi to Skype.
      invoke "NAME #{application_name}"
      invoke "PROTOCOL 7"

      @attached = true
    end

    def invoke(message)
      raise "Not attached to skype. Call Skype::Api.attach first." unless @attached

      api.Invoke(message)
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

    def bus
      DBus::SessionBus.instance
    end

    def initialize
    end
  end
end