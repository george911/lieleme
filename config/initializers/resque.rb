require "redis"
Resque.redis = Redis.new(:url => 'redis://123.57.191.137:6379/15')
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

