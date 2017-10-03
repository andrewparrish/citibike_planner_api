require File.expand_path(File.dirname(__FILE__) + "/../environment")

require 'uri'
require 'resque'
require 'resque-scheduler'
require 'resque/scheduler/server'
# redis_url = ENV["REDISCLOUD_URL"] || ENV["OPENREDIS_URL"] || ENV["REDISGREEN_URL"] || ENV["REDISTOGO_URL"]
# uri = URI.parse(redis_url)
# Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.schedule = YAML.load_file(File.join("config", "schedule.yml"))
