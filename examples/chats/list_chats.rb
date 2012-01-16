#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'rype'
require 'pp'

Rype.attach

Rype.chats do |chats|
  chats.each do |chat|
    p chat
  end
end
