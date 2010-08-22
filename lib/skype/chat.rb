require 'skype/events'

module Skype
  class Chat
    class << self
      attr_accessor :chats

      def all
        chats if chats

        Api.invoke("SEARCH CHATS")
        sleep 0.01 while chats.nil?
        
        yield chats
      end
    end

    attr_reader :chatname

    def initialize(chatname)
      @chatname = chatname
    end

    def send_message(message)
      Api.invoke("CHATMESSAGE #{@chatname} #{message}")
    end
  end
end
