#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'skype'

Skype.attach

message_body = 'test hi'
chat_id = 'enteryourchatidhere'

Skype.chat(chat_id).send_message(message_body)
