require 'spec_helper'

describe Safely::Strategy::Hoptoad do
  it "should be configurable" do
    Safely::Strategy::Hoptoad.should respond_to(:hoptoad_key)
    Safely::Strategy::Hoptoad.should respond_to(:hoptoad_key=)
  end

  it "should report when configured" do
    Safely::Strategy::Hoptoad.hoptoad_key = "foo"

    Toadhopper.any_instance.expects(:post!)

    safely do
      raise "Argh"
    end
  end

  it "should not bother when not configured" do
    Safely::Strategy::Hoptoad.hoptoad_key = nil

    Toadhopper.any_instance.expects(:post!).never

    safely do
      raise "Argh"
    end
  end
end
