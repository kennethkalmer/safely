module Safely
  module Strategy
    class Hoptoad

      class << self

        # Hoptoad API key to use for reporting errors
        attr_accessor :hoptoad_key
        attr_accessor :hoptoad_host

        def load!
          begin
            require 'toadhopper'
          rescue LoadError
            $stderr.write( "'toadhopper' not available, safely cannot use the Hoptoad strategy" )
          end
        end

        def report!( exception )
          params = {}
          params[:notify_host] = self.hoptoad_host if !self.hoptoad_host.nil?

          if defined?( Toadhopper ) && !self.hoptoad_key.nil?
            Toadhopper.new(self.hoptoad_key, params).post!(exception)
          end
        end

      end
    end
  end
end
