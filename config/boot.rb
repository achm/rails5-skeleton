# dockerが落ちたりした時にserverが立ち上がらなくなるのを防ぐ
File.delete(File.expand_path('../../tmp/pids/server.pid',  __FILE__)) rescue
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
