require 'spec_helper'
require 'fileutils'

describe Safely::Backtrace do
  before(:each) do
    @temp_dir = File.expand_path('../backtrace/tmp', __FILE__)

    FileUtils.rm_rf( @temp_dir )
    FileUtils.mkdir_p( @temp_dir )
  end

  it "can be configured" do
    expect(Safely::Backtrace).to respond_to(:trace_directory)
  end

  it "can be enabled" do
    Safely::Backtrace.enable!
  end

  it "should log a backtrace on unsafe shutdown" do
    `ruby #{File.expand_path('../backtrace/unsafe.rb', __FILE__)}`

    entries = Dir["#{@temp_dir}/backtrace-*.log"]
    expect(entries).not_to be_empty
  end

  it "should not log a backtrace on a safe shutdown" do
    `ruby #{File.expand_path('../backtrace/safe.rb', __FILE__)}`

    entries = Dir["#{@temp_dir}/backtrace-*.log"]
    expect(entries).to be_empty
  end
end
