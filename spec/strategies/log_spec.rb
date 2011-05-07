require 'spec_helper'

describe Safely::Strategy::Log do
  it "should support setting a logger" do
    Safely::Strategy::Log.should respond_to(:logger)
    Safely::Strategy::Log.should respond_to(:logger=)
  end

  it "should support setting flushing" do
    Safely::Strategy::Log.should respond_to(:flush)
    Safely::Strategy::Log.should respond_to(:flush=)
  end

  describe "reporting" do
    it "should log exceptions when configured" do
      logger = FakeLogger.new

      Safely::Strategy::Log.logger = logger

      safely do
        raise "Argh"
      end

      logger.lines.should_not be_empty
      logger.to_s.should match(/RuntimeError/)
      logger.to_s.should match(/Backtrace/)
    end

    it "should flush logger when configured" do
      logger = FakeLogger.new

      Safely::Strategy::Log.logger = logger
      Safely::Strategy::Log.flush = true

      logger.expects(:flush)

      safely do
        raise "Argh"
      end
    end

    it "should do nothing if not configured" do
      safely do
        raise "Argh"
      end
    end
  end
end
