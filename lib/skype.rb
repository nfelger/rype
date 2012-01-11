require 'forwardable'

require 'skype/api'
require 'skype/chat'
require 'skype/chatmessage'
require 'skype/events'

module Skype
  Offline = Class.new StandardError
  Denied  = Class.new StandardError

  class << self
    extend Forwardable

    def_delegators Skype::Api,    :instance, :attach, :thread
    def_delegator  Skype::Chat,   :new, :chat
    def_delegator  Skype::Chat,   :all, :chats
    def_delegator  Skype::Events, :on

    Skype::Events.initialize_listeners
  end
end

