module Safely
  class Config

    # List of strategies to use
    attr_reader :strategies

    def initialize
      @strategies = [
        Safely::Strategy::Rollbar,
        Safely::Strategy::Log
      ]
    end
  end
end
