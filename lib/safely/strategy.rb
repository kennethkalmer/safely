module Safely
  module Strategy
    autoload :Hoptoad, 'safely/strategy/hoptoad'
    autoload :Log,     'safely/strategy/log'
    autoload :Mail,    'safely/strategy/mail'
  end
end
