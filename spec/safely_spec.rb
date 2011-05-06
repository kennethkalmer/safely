require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Safely do
  describe "configuration" do
    it "should accept a Hoptoad api key" do
      Safely.configure do |c|
        c.hoptoad_key = "foo"
      end

      Safely.config.hoptoad_key.should == "foo"
    end
  end

  describe "integration" do
    it "should be mixed into Kernel" do
      Object.should respond_to(:safely)
    end

    it "should be mixed into instances" do
      Object.new.should respond_to(:safely)
    end
  end

  describe "strategies" do
    it "should load Toadhopper if present" do
      Safely.load_strategies!

      defined?( Toadhopper ).should be_true
    end

    it "should load Mail if present" do
      Safely.load_strategies!

      defined?( Mail ).should be_true
    end
  end

  describe "usage" do
    it "should report exceptions to hoptoad" do
      Safely::Strategy::Hoptoad.expects(:report!)
      Safely::Strategy::Mail.expects(:report!)

      safely do
        raise "Hello"
      end
    end
  end
end
