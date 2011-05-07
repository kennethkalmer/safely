$:.unshift File.expand_path('../../../lib', __FILE__)

require 'safely'

Safely::Backtrace.trace_directory = File.expand_path('../tmp', __FILE__)
Safely::Backtrace.enable!

safely do
  raise "Oops :/"
end

Safely::Backtrace.safe_shutdown!
