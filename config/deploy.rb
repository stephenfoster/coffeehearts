# Please install the Engine Yard Capistrano gem
# gem install eycap --source http://gems.engineyard.com
require "eycap/recipes"

set :keep_releases, 5
set :application,   'test'
set :repository,    'git://github.com/stephenfoster/coffeehearts.git'
set :deploy_to,     "/data/#{application}"
set :deploy_via,    :export
set :monit_group,   "#{application}"
set :scm,           :git

# This is the same database name for all environments
set :production_database,'test_production'

set :environment_host, 'localhost'
set :deploy_via, :remote_cache

# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
default_run_options[:pty] = true # required for svn+ssh:// andf git:// sometimes

# This will execute the Git revision parsing on the *remote* server rather than locally
set :real_revision, 			lambda { source.query_revision(revision) { |cmd| capture(cmd) } }


task :CRM_NITLE do
  role :web, '174.129.195.171'
  role :app, '174.129.195.171'
  role :db, '174.129.195.171', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'nitle'
  set :dbpass,        'kmwYlwWwJ2'
  set :user,          'nitle'
  set :password,      'kmwYlwWwJ2'
  set :runner,        'nitle'
end


# TASKS
# Don't change unless you know what you are doing!
after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:update_code","deploy:symlink_configs"

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
