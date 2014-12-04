module Safely
  module Strategy
    autoload :Rollbar, 'safely/strategy/rollbar'
    autoload :Log,     'safely/strategy/log'
  end
end
