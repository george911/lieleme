require "redis"
Resque.redis = Redis.new(:url => 'redis://localhost:6379/15')
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

