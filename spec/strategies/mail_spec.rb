require 'spec_helper'

describe Safely::Strategy::Mail do
  describe "configuration" do
    %w( recipient sender subject_prefix ).each do |attr|
      it "should support configuring #{attr}" do
        Safely::Strategy::Mail.should respond_to( attr )
        Safely::Strategy::Mail.should respond_to( "#{attr}=" )
      end
    end
  end

  describe "reporting" do
    it "should be enabled when configured" do
      Safely::Strategy::Mail.recipient = "kenneth.kalmer@gmail.com"

      safely do
        raise "Argh"
      end

      Mail::TestMailer.deliveries.should_not be_empty

      mail = Mail::TestMailer.deliveries.last

      mail.to_addrs.should include("kenneth.kalmer@gmail.com")
      mail.body.should match(/Backtrace/)
    end

    it "should not bother if not configured" do
      Safely::Strategy::Mail.recipient = nil

      expect {
        safely do
          raise "Argh"
        end
      }.to_not change( Mail::TestMailer.deliveries, :length )
    end
  end
end
