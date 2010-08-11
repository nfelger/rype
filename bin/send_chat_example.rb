#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'skype'

Skype.attach

chat_id = 'enteryourchatidhere'
message_body = 'test hi'

Skype::Chat.new(chat_id).send_message(message_body)
