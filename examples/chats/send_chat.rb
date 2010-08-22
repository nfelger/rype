#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'skype'

Skype.attach

chat_id, message_body = ARGV[0..1]

Skype.chat(chat_id).send_message(message_body)
