# WP Deploy

A stupid simple system for deploying a WordPress site via [Capistrano](https://github.com/capistrano/capistrano).

## Setup
1. Place your custom theme in the `assets/theme` directory
2. Place any plugins in the `assets/plugins` directory
3. Edit `config/deploy.rb` and `config/deploy/*.rb`

## Configuration
In config/deploy.rb you need to edit the following at a minimum:

    set :application, 'site.com'
    set :repo_url, 'git@github.com:account/site.git'
    set :deploy_to, '/var/www/site.com/wordpress'
    set :theme, 'theme-name-to-use'
    set :site_path, '/var/www/site.com/public'

## How it works
The default configuration assumes the following directory structure in your web directory:

    /var/www/site.com/
      public/            # Web accessible files
      wordpress/         # Capistrano files

Once you deploy, ala `cap production deploy`, Capistrano will symlink the `assets/theme` and `assets/plugins` to the appropriate directories as defined in the `config/deploy.rb` file.

## Contributing
1. Fork the repo on GitHub
2. Commit changes to a topic branch
3. Submit a pull request
