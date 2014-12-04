require 'spec_helper'

describe Safely::Strategy::Rollbar do
  let(:rollbar) { double('rollbar') }
  before :each do
    described_class.clear!
  end


  it "should report to rollbar when configured" do
    described_class.rollbar = rollbar
    expect(rollbar).to receive(:log)

    safely do
      raise "Argh"
    end
  end

  it "should not bother when not configured" do
    expect(rollbar).not_to receive(:log)

    safely do
      raise "Argh"
    end
  end
end
