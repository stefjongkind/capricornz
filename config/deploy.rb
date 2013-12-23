set :user, 'waiatea2'
set :svn_username, "waiatea2"
set :server, 'waiateara.co.nz'
set :applicationdir, 'railsapp' 
set :repository, "http://waiateara.svnrepository.com/svn/waiateara " 

role :web, 'waiateara.co.nz'
role :app, 'waiateara.co.nz'
role :db,  'waiateara.co.nz', :primary => true

set :use_sudo, false                       # HostingRails users don\\\'t have sudo access
set :deploy_to, "/home/#{user}/#{applicationdir}" 

set:keep_releases, 5
default_run_options[:pty] = true


