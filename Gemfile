source 'https://rubygems.org'

ruby "2.2.0"

gem 'rails',                '4.2.1'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder'

gem 'bootstrap-sass'
gem 'haml-rails'
gem 'crummy'

gem 'forgery'

gem 'puma'

gem 'business_time'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'debugger'
  gem 'quiet_assets'

  gem 'hirb'
  gem 'binding_of_caller'
  gem 'awesome_print'

  gem 'guard'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'meta_request'
end


group :development, :test do
  gem 'sqlite3'

  gem 'pry-remote'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-nav'

  gem 'rspec-rails'

  gem 'libnotify'
  gem 'rb-fsevent',                         require: false  if RUBY_PLATFORM.match(/darwin/)
  gem 'rb-inotify',                         require: false  unless RUBY_PLATFORM.match(/darwin/)

  gem 'fuubar'

  gem 'factory_girl_rails'
end

group :test do

  gem 'capybara'
  gem 'poltergeist'

  gem 'guard-rspec'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'zeus'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end
