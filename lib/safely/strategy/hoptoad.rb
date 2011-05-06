module Safely
  module Strategy
    class Hoptoad

      class << self

        # Hoptoad API key to use for reporting errors
        attr_accessor :hoptoad_key
        
        def load!
          begin
            require 'toadhopper'
          rescue LoadError
            $stderr.write( "'toadhopper' not available, safely cannot use the Hoptoad stategy" )
          end
        end

        def report!( exception )
          if defined?( Toadhopper ) && !self.hoptoad_key.nil?
            Toadhopper( self.hoptoad_key ).post!( exception )
          end
        end

      end

    end
  end
end
