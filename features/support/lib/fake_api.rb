require 'forwardable'

module Rype
  class FakeApi < Api
    class << self
      extend Forwardable

      def_delegator :instance, :recorded_messages
    end

    def attach
    end

    def invoke(message)
      recorded_messages << message
    end

    def recorded_messages
      @recorded_messages ||= []
    end
  end
end
