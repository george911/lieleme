require 'net/ssh/proxy/command'

# config valid only for current version of Capistrano
lock '3.4.0'
# server "45.56.73.38", :web, :app, :db, primary: true
server "deployer@45.56.73.38", roles: [:app, :web, :db], :primary => true  
#set :stage, :productin

set :application, 'lieyohui'
set :repo_url, 'git@github.com:george911/lieyohui.git'
set :user, "deployer"
set :deploy_to,"/u/apps/#{fetch(:application)}" 
set :deploy_via, :remote_cache
set :use_sudo, false
#default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
after "deploy", "deploy:cleanup" # keep only the last 5 releases
# config/deploy.rb
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.0.0-p481'
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    #task command, roles: :app, except: {no_release: true} do
    task command do
      on roles(:web) do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end
  end

  task :setup_config do
    on roles(:web) do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  end

  task :symlink_config do
    on roles(:web) do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  end

end

