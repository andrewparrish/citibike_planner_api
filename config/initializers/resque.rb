require 'uri'
require 'resque'
redis_url = ENV["REDISCLOUD_URL"] || ENV["OPENREDIS_URL"] || ENV["REDISGREEN_URL"] || ENV["REDISTOGO_URL"]
uri = URI.parse(redis_url)
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.redis.namespace = "citibikeplanner"