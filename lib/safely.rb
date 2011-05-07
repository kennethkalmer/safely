$:.unshift File.expand_path('../', __FILE__)

module Safely

  VERSION = "0.1.0"

  autoload :Config,   'safely/config'
  autoload :Mixin,    'safely/mixin'
  autoload :Strategy, 'safely/strategy'

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
      @config.strategies.each { |s| s.load! }
    end

    def report!( exception )
      load_strategies! if @config.nil?

      @config.strategies.each { |s| s.report! exception }
    end

    private

    def config=( config )
      @config = config
    end

  end

end

Object.send( :include, Safely::Mixin )
Object.send( :extend, Safely::Mixin )
