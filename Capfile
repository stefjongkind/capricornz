load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

after "deploy:update_code", :roles => [:web, :db, :app] do
	run "chown -R #{user}:#{user} /home/#{user}/#{applicationdir}" 
	run "chmod 755 #{release_path}/public -R" 
	run "rm -rf #{release_path}/public/pictures"
	run "ln -nfs #{shared_path}/system/pictures #{release_path}/public/pictures" 
	run "cd /home/#{user}; mv public_html public_html_bk; ln -s #{current_path}/public ~/public_html"
	run "ln -s /home/waiatea2/railsapp/capricornz/current/public  ~/public_html/capricornz.com"
	run "chmod 755 ~/public_html/capricornz.com -R" 
end

after "deploy:update", "deploy:cleanup" 

namespace :deploy do
	desc "cold deploy" 
	task :cold do
		update
		passenger::restart
	end

	desc "Restart Passenger" 
	task :restart do
		passenger::restart
	end
end

namespace :passenger do
	desc "Restart Passenger" 
	task :restart do
		run "cd #{current_path} && touch tmp/restart.txt" 
	end
end
