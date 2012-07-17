require 'spec_helper'

module Rype
  describe Logger do
    after do
      # so other tests get consistent behavior.
      Logger.instance_variable_set("@logger", nil)
    end

    it "should delegate to an underlying ::Logger by default" do
      logger = double("logger")
      logger.should_receive(:info).with("a message").once

      ::Logger.should_receive(:new).with(STDERR).and_return(logger)

      Logger.info("a message")
    end

    it "should be able to have an alternate logger set" do
      logger = double("logger")
      logger.should_receive(:info).with("a message").once

      Logger.set(logger)
      Logger.info("a message")
    end
  end
end
