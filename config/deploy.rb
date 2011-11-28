###############################
#
# Capistrano Deployment on shared Webhosting by RailsHoster
#
# maintained by support@railshoster.de
#
###############################

# BITTE ENTFERNEN SIE DIE FOLGENDE ZEILE WENN SIE BUNDLER NICHT BENUTZEN
require 'bundler/capistrano'


#### Personal Settings
## User and Password

# user to login to the target server
set :user, "htmlcast"

# password to login to the target server
# set :password, "none"

# allow SSH-Key-Forwarding
set :ssh_options, { :forward_agent => true }

## Application name and repository

# application name ( should be rails1 rails2 rails3 ... )
set :application, "htmlcast"

# repository location
set :repository, "git@github.com:torben/HTMLcast.git"

# :subversionn or :git
set :scm, :git
set :scm_verbose, true

#### System Settings
## General Settings ( don't change them please )

# run in pty to allow remote commands via ssh
default_run_options[:pty] = true

# don't use sudo it's not necessary
set :use_sudo, false

# set the location where to deploy the new project
set :deploy_to, "/var/www/#{application}"

# live
role :app, "server1686.railsvserver.de"
role :web, "server1686.railsvserver.de"
role :db,  "server1686.railsvserver.de", :primary => true


############################################
# Default Tasks by RailsHoster.de
############################################
namespace :deploy do

  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Additional Symlinks ( database.yml, etc. )"
  task :additional_symlink, :roles => :app do
    run "ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    #run "ln -s #{shared_path}/config/cert/apn-cert.pem #{current_path}/config/cert/apn-cert.pem"
    #run "ln -s #{shared_path}/config/cert/apn-key.pem #{current_path}/config/cert/apn-key.pem"
  end

end
after "deploy:symlink","deploy:additional_symlink","deploy:migrate"
