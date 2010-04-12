require 'forwardable'

require 'skype/api'
require 'skype/chat'

module Skype
  class << self
    extend Forwardable

    def_delegator Skype::Api,  :new, :instance
    def_delegator Skype::Api,  :attach
    def_delegator Skype::Chat, :new, :chat
  end
end
