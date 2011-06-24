#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

# Alter db:schema:load to use the primary pfcs app's schema file
namespace :db do
  namespace :schema do
    desc "Load the pfcs app's schema"
    task :load do
      ENV['SCHEMA'] = "../pfcs/db/schema.rb"
    end
  end
end

Pfcsmobile::Application.load_tasks

