#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'skype'
require 'pp'

Skype.attach

Skype.chats do |chats|
  chats.each do |chat|
    p chat
  end
end
