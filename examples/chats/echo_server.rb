#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'rype'
require 'pp'

Rype.on(:chatmessage_received) do |chatmessage|
  chatmessage.chat do |chat|
    chatmessage.body do |body|
      chat.send_message(body)
    end
  end
end

Rype.attach.join
