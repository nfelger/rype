module Skype
  class Chatmessage
    def initialize(id)
      @chatmessage_id = id
    end
    
    def chat(&block)
      return unless block_given?
      get_property("CHATNAME") do |chatname|
        block.call(Chat.new(chatname))
      end
    end
    
    def body(&block)
      return unless block_given?
      get_property("BODY", &block)
    end

  private
    def get_property(property, &block)
      return unless block_given?
      Api.invoke("GET CHATMESSAGE #{@chatmessage_id} #{property}") do |message|
        yield message.split[3..-1].join(' ')
      end
    end
  end
end
