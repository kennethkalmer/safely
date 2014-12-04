module Safely
  module Strategy
    class Log
      SEVERITIES = {
        'debug' => 0,
        'info' => 1,
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
          @logger ||= ::Logger.new(STDOUT)
          @flush ||= false
        end

        def log(level, *args)
          return if self.logger.nil?
          #matches the integers from ::Logger::SEV_LEVEL array
          severity = SEVERITIES.fetch(level, 5)
          args.each do |arg|
            #Logger::Formatter will stringify the arg
            self.logger.add(severity, arg)
          end

          self.logger.flush if self.logger.respond_to?(:flush) && self.flush
        end
      end
    end
  end
end
