module Safely
  class Config
    # List of strategies to use
    attr_reader :strategies

    def initialize
      @hashed = {
        rollbar: Safely::Strategy::Rollbar,
        log: Safely::Strategy::Log,
      }
      @strategies = @hashed.values
    end

    def log_strategy
      @hashed[:log]
    end

    def report_strategy
      @hashed[:rollbar]
    end
  end
end
