require 'skype'
require File.join(File.dirname(__FILE__), '..', 'features', 'support', 'lib', 'fake_api')
require 'pp'

Skype::Api.instance_variable_set(:"@instance", Skype::FakeApi.instance)
