require "safely/version"

module Safely

  autoload :Backtrace, 'safely/backtrace'
  autoload :Config,    'safely/config'
  autoload :Mixin,     'safely/mixin'
  autoload :Strategy,  'safely/strategy'

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
      config.strategies.each { |s| s.load! }
    end

    def debug(*args)
      log('debug', *args)
    end

    # See log() above
    def info(*args)
      log('info', *args)
    end

    # See log() above
    def warn(*args)
      log('warning', *args)
    end

    # See log() above
    def warning(*args)
      log('warning', *args)
    end

    # See log() above
    def error(*args)
      log('error', *args)
    end

    # See log() above
    def critical(*args)
      log('critical', *args)
    end

    def log(level, *args)
      load_strategies! if @config.nil?

      config.strategies.each { |s| s.log(level, *args) }
    end

    def just_log(level, *args)
      load_strategies! if @config.nil?
      config.log_strategy.log(level, *args)
    end

    def just_report(level, *args)
      load_strategies! if @config.nil?
      config.report_strategy.log(level, *args)
    end

    private

    def config=( config )
      @config = config
    end

  end

end

Object.send( :include, Safely::Mixin )
Object.send( :extend, Safely::Mixin )
