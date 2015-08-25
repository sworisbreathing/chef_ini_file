require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'chefspec'
ChefSpec::Coverage.start!
require 'chefspec/berkshelf'
