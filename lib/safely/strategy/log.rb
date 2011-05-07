module Safely
  module Strategy
    class Log
      
      class << self
        
        # Logger to use
        attr_accessor :logger

        # Flush logger
        attr_accessor :flush

        def load!
          @flush ||= false
        end

        def report!( exception )
          return if self.logger.nil?

          self.logger.error("[SAFELY] Type: #{exception.class.name}")
          self.logger.error("[SAFELY] Message: #{exception.message}")
          self.logger.error("[SAFELY] Backtrace: #{exception.backtrace.join("\n  ")}")

          self.logger.flush if self.logger.respond_to?(:flush) && self.flush
        end
      end

    end
  end
end
