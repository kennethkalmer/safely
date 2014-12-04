module Safely
  module Strategy
    class Rollbar

      class << self
        # Instance to use
        attr_accessor :rollbar

        def load!
        end

        def clear!
          @rollbar = nil
        end

        def log(level, *args)
          return if self.rollbar.nil?

          self.rollbar.log(level.to_s, *args)
        end
      end
    end
  end
end
