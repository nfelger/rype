require 'rype/events'

module Rype
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

    def topic(&block)
      get_property('TOPIC', &block)
    end

    def members(&block)
      get_property('MEMBERS') do |member_list|
        yield member_list.split(/ /)
      end
    end

    def add_members(members)
      Api.invoke("ALTER CHAT #{@chatname} ADDMEMBERS #{members.join(' ')}")
    end

  private
    def get_property(property, &block)
      return unless block_given?
      Api.invoke("GET CHAT #{chatname} #{property}") do |message|
        yield message.split[3..-1].join(' ')
      end
    end
  end
end
