Given /^I am using the Skype Api testing fake$/ do
  # Silence constant re-assignment warning.
  original_verbosity = $VERBOSE
  $VERBOSE = nil
  Skype::Api = Skype::FakeApi
  $VERBOSE = original_verbosity
end

Given /^there is a chat with id "([^\"]*)"$/ do |chat_id|
  # Let's assume it exists.
end

When /^I send a chatmessage "([^\"]*)" to "([^\"]*)"$/ do |message_body, chat_id|
  Skype::Chat.new(chat_id).send_message(message_body)
end

Then /^the Skype Api should receive the message$/ do |string|
  Skype::Api.recorded_messages.should include(string)
end