
# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user  # Don't use system-wide RVM

require 'bundler/capistrano'

set :scm, :git
set :runner, "dylan"
default_run_options[:pty] = true
set :application, "ios.petefowler.com"
set :repository,  "git@github.com:dmarkow/pfcsmobile --depth=1"
set :branch, "master"
set :scm_command, "/usr/bin/git"

# set :deploy_to, "/var/www/#{application}"
role :app, "ios.petefowler.com"
role :web, "ios.petefowler.com"
role :db,  "ios.petefowler.com", :primary => true

desc "Create database.yml in shared/config" 
task :setup_configs do
  run <<-EOF
  mkdir -p #{deploy_to}/shared/config && 
  rm #{release_path}/config/database.yml && 
  ln -nfs #{release_path}/config/database.yml.production #{release_path}/config/database.yml
EOF
end

after "deploy:update_code", :setup_configs

namespace :deploy do
  desc "Stop the server"
  task :stop, :roles => :app do
    puts "Not valid for phusion"
  end
  
  desc "Restart the server"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Start the server"
  task :start, :roles => :app do
    puts "Not valid for phusion"
  end
end

