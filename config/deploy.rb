lock '3.4.0'

# Base
set :application, 'site-name'
set :repo_url, 'git@github.com:account/repository.git'
set :deploy_to, '/var/www/site-name/wordpress'
set :scm, :git

# Custom for WP
set :theme, 'theme-name'
set :site_path, '/var/www/site-name/public'

namespace :deploy do
  desc "Symlink all WP assets"
  task :symlink_wp_assets do
    on roles(:web) do
      full_path = "#{fetch(:site_path)}/wp-content/"
      execute "ln -s #{current_path}/assets/theme #{full_path}/themes/#{fetch(:theme)}"
      execute "ln -s #{current_path}/assets/plugins #{full_path}/plugins"
    end
  end
end

after "deploy", "deploy:symlink_wp_assets"
