module Safely
  module Strategy
    class Mail

      class << self

        # Recipient of the exception mails
        attr_accessor :recipient

        # The sender
        attr_accessor :sender

        # Subject prefix
        attr_accessor :subject_prefix

        def load!
          begin
            require 'mail'
          rescue LoadError
            $stderr.write( "'mail' not available, safely cannot use the email stategy" )
          end

          if self.sender.nil?
            require 'socket'
            self.sender = "safely@#{Socket.gethostname}"
          end

          self.subject_prefix ||= "[SAFELY]"
        end

        def report!( exception )
          return if self.sender.nil? || self.recipient.nil?

          mail = ::Mail.new
          mail.from = self.sender
          mail.to   = self.recipient
          mail.subject = "#{subject_prefix} - #{exception.message}"

          mail.body = <<-EOF
            Safely caught an unhandled exception in your application, details below:

            Type: #{exception.class.name}
            Message: #{exception.message}

            Backtrace:
            #{exception.backtrace.join("\n  ")}
            EOF

          mail.deliver
        end

      end
    end
  end
end
