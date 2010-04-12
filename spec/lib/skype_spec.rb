require 'spec_helper'
require 'skype'

describe Skype, '.instance' do
  subject { Skype.instance }
  it { should be_a(Skype::Api) }
end

describe Skype, '.attach' do
  it "should forward attach to Skype::Api" do
    Skype::Api.stub :attach
    Skype::Api.should_receive(:attach).with("chat id")

    Skype.attach("chat id")
  end
end

describe Skype, '.chat' do
  subject { Skype.chat('chat id') }
  it { should be_a(Skype::Chat) }
end


