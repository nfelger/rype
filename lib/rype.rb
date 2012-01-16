require 'forwardable'

require 'rype/api'
require 'rype/chat'
require 'rype/chatmessage'
require 'rype/events'

module Rype
  Offline = Class.new StandardError
  Denied  = Class.new StandardError

  class << self
    extend Forwardable

    def_delegators Rype::Api,    :instance, :attach, :thread
    def_delegator  Rype::Chat,   :new, :chat
    def_delegator  Rype::Chat,   :all, :chats
    def_delegator  Rype::Events, :on

    Rype::Events.initialize_listeners
  end
end

