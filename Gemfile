source 'https://rubygems.org'

gem 'rails', '3.2.13'
#gem 'proteste_generate_application', :git => 'https://7f48847aabeed11d9f0e1358ef171debccfb79a6:x-oauth-basic@github.com/proteste/paf-application.git'
gem 'proteste_generate_application', :path => '~/paf-application' 
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'proteste_scaffold',  :path => '~/paf-scaffold'
gem 'proteste_auth',      :path => '~/paf-auth'
gem 'proteste_authorize', :path => '~/paf-authorize'

#gem 'proteste_scaffold',    git: 'https://4347f04925c36c7c6c8b477cf89d55cefbc070b1:x-oauth-basic@github.com/proteste/paf-scaffold.git'
#gem 'proteste_auth',        git: 'https://54ce42d5673c0aa07bbfbb4d8b77f79e1e6a5f23:x-oauth-basic@github.com/proteste/paf-auth.git'
#gem 'proteste_authorize',   git: 'https://0f022deb564668d3c9dcbdc6f17cf2f07b6ffdc4:x-oauth-basic@github.com/proteste/paf-authorize.git'
group :development, :test do
  gem "rspec"
  gem "rspec-rails"
end


#============= Attention
#- Store this values save on Application entity in Access Control 2
#- Random App Id:      6e6469e1d695388292c836162be9ef264081ed0683a47b
#- Random App Secret:  45e1bd946aa5ec60b5ede929b4b003f8110de75bf1f67985cfaaea6773414bf15a7644d874bbc3b8af837d
