module Skype
  class Chat
    class << self
      def all
        chats = Api.invoke("SEARCH CHATS")
        
        chats[6..-1].split(', ').map do |chat_id| 
          Chat.new(chat_id)
        end
      end
    end

    attr_reader :chat_id

    def initialize(chat_id)
      @chat_id = chat_id
    end

    def send_message(message)
      Api.invoke("CHATMESSAGE #{@chat_id} #{message}")
    end
  end
end
