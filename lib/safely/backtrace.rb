module Safely
  class Backtrace
    
    class << self

      attr_accessor :trace_directory

      def enable!
        @enabled = true
        at_exit { log_exceptions }
      end

      def safe_shutdown!
        @enabled = false
      end

      def log_exceptions
        STDERR.puts("In #log_exceptions. @enabled=#{@enabled}, trace_directory=#{trace_directory}")
        return unless @enabled && self.trace_directory && File.directory?( self.trace_directory )

        require 'logger'

        trace_file = File.join( self.trace_directory, "backtrace-#{Time.now.strftime('%Y%m%d%H%M%S')}-#{Process.pid}.log" )
        trace_log = Logger.new( trace_file )

        # Find the last exception
        e = nil
        ObjectSpace.each_object {|o|
          if ::Exception === o
            e = o
          end
        }

        trace_log.info "*** Below you'll find the most recent exception thrown, this will likely (but not certainly) be the exception that made your application exit abnormally ***"
        trace_log.error e

        trace_log.info "*** Below you'll find all the exception objects in memory, some of them may have been thrown in your application, others may just be in memory because they are standard exceptions ***"
        ObjectSpace.each_object {|o|
          if ::Exception === o
            trace_log.error o
          end
        }

        trace_log.close
      end
    end

  end
end
