require 'skype/chat'

# describe Skype::Chat, '.all' do
#   subject { Skype::Chat }
# 
#   it "should get the list of chats from the api" do
#     Skype.instance.should_receive(:invoke).with("SEARCH CHATS") do
#       Skype.instance.notify("CHATS")
#     end
# 
#     subject.all
#   end
# 
#   context "when the response contains chats" do
#     before(:each) do
#       Skype.instance.stub!(:invoke).with("SEARCH CHATS") do
#         Skype.instance.notify("CHATS #bitman/$jessy;eb06e65612353279, #bitman/$jdenton;9244e98f82d7d391")
#       end
#     end
# 
#     it "should return a new Chat object for each chat id in the response" do
#       subject.all do |chats|
#         chats.all?{|chat| chat.should be_a(Skype::Chat)}
#         chats.map{|chat| chat.chatname}.should == ["#bitman/$jessy;eb06e65612353279", "#bitman/$jdenton;9244e98f82d7d391"]
#       end
#     end
#   end
# end

describe Skype::Chat, '#send_message' do
  subject { Skype::Chat.new('#test/$echo123;2010fc482c5ce233') }

  it "should tell the api to send the message" do
    Skype.instance.should_receive(:invoke).
      with("CHATMESSAGE #test/$echo123;2010fc482c5ce233 ohai Zkaip")

    subject.send_message("ohai Zkaip")
  end
end