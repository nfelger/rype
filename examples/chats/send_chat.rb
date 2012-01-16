#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'rype'

Rype.attach

chat_id, message_body = ARGV[0..1]

Rype.chat(chat_id).send_message(message_body)
