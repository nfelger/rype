require 'logger'

module Rype
  class Logger
    class << self
      def method_missing(*args, &block)
        logger.send(*args, &block)
      end

      def set(logger)
        @logger = logger
      end

      private

      def logger
        @logger ||= ::Logger.new(STDERR)
      end
    end
  end
end
