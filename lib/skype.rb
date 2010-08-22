require 'forwardable'

require 'skype/api'
require 'skype/chat'
require 'skype/chatmessage'
require 'skype/events'

module Skype
  class << self
    extend Forwardable

    def_delegator Skype::Api,    :instance, :instance
    def_delegator Skype::Api,    :attach
    def_delegator Skype::Chat,   :new, :chat
    def_delegator Skype::Chat,   :all, :chats
    def_delegator Skype::Events, :on
    
    Skype::Events.initialize_listeners
  end
end

