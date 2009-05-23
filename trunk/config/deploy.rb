set :application, "scraper"
set :domain, "scraper.protaskm.com" 
set :repository,  "http://rorscraper.googlecode.com/svn/trunk/"
set :user, "protask"
#set :scm_username, "faivrem"
set :use_sudo, false
set :deploy_via, :checkout
set :group_writable, false

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/protask/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "protaskm.com"
role :web, "protaskm.com"
role :db,  "protaskm.com", :primary => true

