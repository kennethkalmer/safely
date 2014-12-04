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
    before do
      expect(Safely::Strategy::Rollbar).to receive(:log)
      expect(Safely::Strategy::Log).to receive(:log)
    end

    it "should report exceptions" do
      safely do
        raise "Hello"
      end
    end

    it 'should report on class method: debug' do
      Safely.debug('Some debug occurred')
    end

    it 'should report on class method: info' do
      Safely.info('Some info occurred')
    end

    it 'should report on class method: warning' do
      Safely.warning('Some warning occurred')
    end

    it 'should report on class method: error' do
      Safely.error('Some error occurred')
    end

    it 'should report on class method: critical' do
      Safely.critical('Some critical occurred')
    end
  end
end
