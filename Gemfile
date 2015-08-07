# Ruby通过brew install ruby安装,rails通过gem 'rails','xxx'安装
source 'http://ruby.taobao.org'
# source 'http://rubygems.org'

gem 'acts_as_votable', '~> 0.10.0'

# user resque to handle background job
gem 'resque'
gem 'resque-scheduler'

gem 'sidekiq'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3' 

# Use option database for developement, test and production 
# Can't find the PostgreSQL client library (libpq)
# *** extconf.rb failed ***
# 原因
# rails没有安装:gem install rails
# pg 0.18.2通过如下方法安装
# $ sudo su //sudo s(witch) u(ser) to root( if no parameters)
# $ env ARCHFLAGS="-arch x86_64" gem install pg -v '0.18.2'
gem 'pg', '~> 0.18.2'

# font awesome
# gem "font-awesome-rails"
gem 'font-awesome-sass'
# bootstrap
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem "less-rails"
gem "therubyracer"

ruby '2.2.2'
# 二维码
gem 'rqrcode'

# cache
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

gem 'unread'
gem 'ffaker'
gem 'rails_12factor', group: :production
# datetime picker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.7.14'

group :development, :test do
  gem "rspec","~>3.0"
  gem "rspec-rails"
  gem "rspec-activemodel-mocks"
  gem "capybara"
  gem 'selenium-webdriver',require:false
  gem 'factory_girl_rails'
  gem 'capybara-webkit',require:false
  gem 'capybara-email'
  gem 'database_cleaner',git: 'git://github.com/DatabaseCleaner/database_cleaner',require:false
#  gem "cucumber-rails",">=0.3.2",:require => false
#  gem "webrat", ">= 0.7.2"
#  gem "selenium-client"
#  gem 'rspec-core', git: 'git://github.com/rspec/rspec-core'
end
gem 'nokogiri'


# Use unicorn as the app server
gem 'unicorn'
#
# 为了css能在heroku上运行
group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end


# Active-admin
gem 'activeadmin', github: 'activeadmin'

# Cancan多级认证
gem 'cancan'

# 用来使用SCSS等
gem 'sprockets' 

# 用来做rating
gem 'ratyrate' # 这个是主力
gem 'jquery-raty-rails', github: 'bmc/jquery-raty-rails'
# gem "letsrate", :git => "git://github.com/iammyr/letsrate.git"

# Paginate
gem 'kaminari'

gem 'jquery-turbolinks'

# Use jquery as the JavaScript library,注意要指定"~> 2.3.0"否则application.js里//= require jquery-ui会报错
gem 'jquery-rails', "~> 2.3.0" 

# 翻译
gem 'rails-i18n', '~> 4.0.0'


# 头像
gem "paperclip"

# 加密
gem 'devise'
# multi-steps
gem 'wicked'

# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.4'
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0' # required
  gem 'capistrano-rbenv-install', '~> 1.2.0'
  gem 'capistrano-postgresql', '~> 4.2.0'
  gem 'capistrano-safe-deploy-to', '~> 1.1.1'
  gem 'capistrano-faster-assets', '~> 1.0'
  gem 'capistrano-unicorn-nginx', '~> 3.1.0'
  gem 'capistrano-secrets-yml', '~> 1.0.0'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
#gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

