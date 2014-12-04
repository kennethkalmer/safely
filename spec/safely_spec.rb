require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Safely do
  describe "integration" do
    it "should be mixed into Kernel" do
      expect(Object).to respond_to(:safely)
    end

    it "should be mixed into instances" do
      expect(Object.new).to respond_to(:safely)
    end
  end

  describe "strategies" do
    it "should not have targets by default" do
      Safely.load_strategies!
      expect(Safely::Strategy::Rollbar.rollbar).to be_nil
      expect(Safely::Strategy::Log.logger).to be_nil
    end
  end

  describe "usage" do
    it "should report exceptions" do
      expect(Safely::Strategy::Rollbar).to receive(:log)
      expect(Safely::Strategy::Log).to receive(:log)

      safely do
        raise "Hello"
      end
    end
  end
end
