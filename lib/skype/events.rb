require 'thread'

module Skype
  class Events
    class << self
      def on(event)
        case event

        when :chatmessage_received
          Skype::Api.instance.on_notification("CHATMESSAGE (.*) STATUS RECEIVED") do |chatmessage_id|
            yield Chatmessage.new(chatmessage_id)
          end

        when :chats_received
          Skype::Api.instance.on_notification("CHATS (.*)") do |chatlist|
            yield chatlist.split(', ').map { |chatname| Chat.new(chatname) }
          end
        end
      end
      
      def initialize_listeners
        mutex = Mutex.new
        Skype::Events.on(:chats_received) do |chats|          
          mutex.synchronize { Skype::Chat.chats = chats }
        end
      end
    end
  end
end
