require 'rype'
require File.join(File.dirname(__FILE__), '..', 'features', 'support', 'lib', 'fake_api')
require 'pp'

Rype::Api.instance_variable_set(:"@instance", Rype::FakeApi.instance)
