# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
# require 'rack-mini-profiler'
# use Rack::MiniProfiler

run Rails.application
