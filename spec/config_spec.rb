require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Safely::Config do
  describe "Hoptoad" do
    it { should respond_to(:hoptoad_key) }
    it { should respond_to(:hoptoad_key=) }
  end
end
