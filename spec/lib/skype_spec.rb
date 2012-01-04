require 'spec_helper'
require 'skype'

describe Skype do
  describe '.instance' do
    subject { Skype.instance }
    it { should be_a(Skype::Api) }
  end

  describe '.attach' do
    it "should delegate to Skype::Api" do
      Skype::Api.should_receive(:attach).with("chat id")
      Skype.attach("chat id")
    end
  end

  describe '.chat' do
    subject { Skype.chat('chat id') }
    it { should be_a(Skype::Chat) }
  end

  describe '.chats' do
    it "should delegate to Skype::Chat" do
      Skype::Chat.should_receive(:all)
      Skype.chats
    end
  end

  describe '.on' do
    it "should delegate to Skype::Events" do
      Skype::Events.should_receive(:on)
      Skype.on
    end
  end

  describe '.thread' do
    it 'should delegate to Skype::Api' do
      Skype::Api.should_receive(:thread)
      Skype.thread
    end
  end
end

