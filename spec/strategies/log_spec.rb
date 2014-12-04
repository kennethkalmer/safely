require 'spec_helper'

describe Safely::Strategy::Log do

  it "should support setting a logger" do
    expect(Safely::Strategy::Log).to respond_to(:logger)
    expect(Safely::Strategy::Log).to respond_to(:logger=)
  end

  it "should support setting flushing" do
    expect(Safely::Strategy::Log).to respond_to(:flush)
    expect(Safely::Strategy::Log).to respond_to(:flush=)
  end

  it "should support clearing the logger" do
    expect(Safely::Strategy::Log).to respond_to(:clear!)
  end

  it "should support using a default logger" do
    expect(Safely::Strategy::Log).to respond_to(:use_default)
  end

  describe 'operation' do
    after do
      Safely::Strategy::Log.clear!
    end

    describe "reporting" do
      it "should log exceptions when configured" do
        io = StringIO.new
        Safely::Strategy::Log.logger = ::Logger.new(io)

        safely do
          raise "Argh"
        end

        expect(io.string).to match(/Argh \(RuntimeError\)/)
      end
    end

    describe 'flushing' do
      it "should flush logger when configured" do
        logger = double('logger', add: true)
        expect(logger).to receive(:flush)

        Safely::Strategy::Log.logger = logger
        Safely::Strategy::Log.flush = true

        safely do
          raise "Argh ....."
        end
      end
    end

    describe 'unconfigured behaviour' do
      it "should do nothing if not configured" do
        safely do
          raise "Argh -----"
        end
      end
    end
  end
end
