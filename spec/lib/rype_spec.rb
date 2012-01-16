require 'spec_helper'
require 'rype'

describe Rype do
  describe '.instance' do
    subject { Rype.instance }
    it { should be_a(Rype::Api) }
  end

  describe '.attach' do
    it "should delegate to Rype::Api" do
      Rype::Api.should_receive(:attach).with("chat id")
      Rype.attach("chat id")
    end
  end

  describe '.chat' do
    subject { Rype.chat('chat id') }
    it { should be_a(Rype::Chat) }
  end

  describe '.chats' do
    it "should delegate to Rype::Chat" do
      Rype::Chat.should_receive(:all)
      Rype.chats
    end
  end

  describe '.on' do
    it "should delegate to Rype::Events" do
      Rype::Events.should_receive(:on)
      Rype.on
    end
  end

  describe '.thread' do
    it 'should delegate to Rype::Api' do
      Rype::Api.should_receive(:thread)
      Rype.thread
    end
  end
end

