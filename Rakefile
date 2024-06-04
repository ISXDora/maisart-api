# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# Rakefile
require 'rake'
require 'brakeman'

namespace :security do
  desc "Run Brakeman to check for security vulnerabilities"
  task :brakeman do
    sh 'bundle exec brakeman'
  end
end



require_relative "config/application"

Rails.application.load_tasks
