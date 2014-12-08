require 'logger'

module Safely
  module Strategy
    class Log
      SEVERITIES = {
        'debug' => 0,
        'info' => 1,
        'warn' => 2,
        'warning' => 2,
        'error' => 3,
        'critical' => 4
      }.freeze

      class << self

        # Logger to use
        attr_accessor :logger

        # Flush logger
        attr_accessor :flush

        def load!
          @flush ||= false
        end

        def use_default
          @logger = ::Logger.new(STDOUT)
        end

        def clear!
          @logger = nil
        end

        def log(level, *args)
          return if self.logger.nil?
          #matches the integers from ::Logger::SEV_LEVEL array
          severity = SEVERITIES.fetch(level.to_s, 5)
          args.each do |arg|
            #Logger::Formatter will stringify the arg
            self.logger.add(severity, arg)
          end

          return unless self.flush

          self.logger.flush if self.logger.respond_to?(:flush)
        end
      end
    end
  end
end
