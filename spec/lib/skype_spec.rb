require 'spec_helper'
require 'skype'

describe Skype, '.instance' do
  subject { Skype.instance }
  it { should be_a(Skype::Api) }
end

describe Skype, '.attach' do
  it "should delegate to Skype::Api" do
    Skype::Api.should_receive(:attach).with("chat id")

    Skype.attach("chat id")
  end
end

describe Skype, '.chat' do
  subject { Skype.chat('chat id') }
  it { should be_a(Skype::Chat) }
end

describe Skype, '.chats' do
  it "should delegate to Skype::Chat" do
    Skype::Chat.should_receive(:all)
    
    Skype.chats
  end
end

describe Skype, '.on' do
  it "should delegate to Skype::Events" do
    Skype::Events.should_receive(:on)
    
    Skype.on
  end
end

