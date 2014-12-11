begin
  require 'coveralls'
  Coveralls.wear_merged!
rescue LoadError
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'safely'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'mail'
Mail.defaults do
  delivery_method :test
end


RSpec.configure do |config|
  config.mock_with(:mocha)

  config.before(:each) do
    Mail::TestMailer.deliveries.clear
  end
end
