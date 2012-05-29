require 'spec_helper'

describe Safely::Strategy::Hoptoad do

  it "should be configurable" do
    Safely::Strategy::Hoptoad.should respond_to(:hoptoad_key)
    Safely::Strategy::Hoptoad.should respond_to(:hoptoad_key=)
    Safely::Strategy::Hoptoad.should respond_to(:hoptoad_host)
    Safely::Strategy::Hoptoad.should respond_to(:hoptoad_host=)
  end

  it "should send the hoptoad_host when config set" do 
    Safely::Strategy::Hoptoad.hoptoad_key = "foo"
    Safely::Strategy::Hoptoad.hoptoad_host = "http://foo"

    toadhopper_instance = mock(:post!)
    Toadhopper.expects(:new).with("foo", { :notify_host => "http://foo" }).returns(toadhopper_instance)

    safely do
      raise "Argh"
    end
  end

  it "should report when configured" do
    Safely::Strategy::Hoptoad.hoptoad_key = "foo"
    Safely::Strategy::Hoptoad.hoptoad_host = nil

    toadhopper_instance = mock(:post!)
    Toadhopper.expects(:new).with("foo", {}).returns(toadhopper_instance)

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
