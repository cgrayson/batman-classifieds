source 'http://rubygems.org'

gem 'rake', '0.9.2'
gem 'rails', '3.1.0'
gem 'will_paginate'
gem 'omniauth', '~> 0.3.0'
gem 'indextank'
gem 'delayed_job'
gem 'state_machine'
gem 'state_machine-audit_trail'
gem 'paperclip'
gem 'aws-s3'
gem 'json'
gem 'rails_autolink'
gem 'jquery-rails'
#gem 'css-bootstrap-rails'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :git => 'git://github.com/anjlab/bootstrap-rails.git',
                              :ref => 'fcf4416687882edf64fd78a4cdd0a470b56f57ea'

gem 'heroku'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'batman-rails', :git => "git://github.com/Shopify/batman-rails.git", :ref => "v0.0.7"
  gem 'uglifier'
end

group :development, :test do
  gem 'sqlite3'
  gem 'mongrel',               '1.2.0.pre2' # Default dev env server
end

group :production do
  gem 'pg'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
