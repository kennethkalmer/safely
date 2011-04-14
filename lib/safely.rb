$:.unshift File.expand_path('../', __FILE__)

module Safely

  VERSION = "0.1.0pre"

  autoload :Config, 'safely/config'
  autoload :Mixin,  'safely/mixin'

  class << self

    def reset!
      self.config = nil
    end

    def configure
      yield self.config
    end

    def config
      @config ||= Safely::Config.new
    end

    def load_strategies!
      begin
        require 'toadhopper'
      rescue LoadError
        # Print warning
      end
    end

    def report!( exception )
      if defined?( Toadhopper ) && !config.hoptoad_key.nil?
        Toadhopper( config.hoptoad_key ).post!( exception )
      else
        STDERR.puts "Toadhopper not available or not configured!"
      end
    end

    private

    def config=( config )
      @config = config
    end

  end

end

Object.send( :include, Safely::Mixin )
Object.send( :extend, Safely::Mixin )
