#!/usr/bin/env ruby

require "safely"

log_dir = "/tmp"
Safely::Backtrace.trace_directory = log_dir
Safely::Backtrace.enable!

raise RuntimeError.new("Have a peek in #{log_dir}")
