module Skype
  class Chat
    def initialize(chat_id)
      @chat_id = chat_id
    end
    
    def send_message(message)
      Api.invoke("CHATMESSAGE #{@chat_id} #{message}")
    end
  end
end
