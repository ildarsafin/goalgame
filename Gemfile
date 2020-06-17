source "https://rubygems.org"

ruby "2.6.5"

gem "rails", "6.0.1"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "jquery-rails"
gem "jquery-ui-rails"

# Use Puma as the app server
gem "puma"
gem 'image_processing', '~> 1.2'

# Use SCSS for stylesheets
gem "sass-rails"
gem "coffee-rails"

gem "active_link_to"
gem "uglifier"
gem "font-awesome-rails"
gem "simple_form"
gem "cocoon"

gem "devise"
gem "kaminari"
gem "responders"
gem "seedbank"
gem "pundit"
gem "slim"
gem "httparty"

gem "acts_as_list"
gem "acts-as-taggable-on"
gem "fog"

group :staging, :production do
  gem "rails_12factor"

  gem "redis"
  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-rails"
  gem "capistrano-rbenv", github: "capistrano/rbenv"
end

group :test do
  gem "simplecov", require: false
  gem "database_cleaner"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock", require: false
  gem "rails-controller-testing"
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "byebug"
  gem "factory_girl_rails"
  gem "fuubar"
  gem "jasmine"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rails_best_practices"
  gem "rspec-rails"
  gem "rubocop"
  gem "scss_lint", require: false
end

group :development do
  gem "foreman"
  gem "letter_opener"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  gem "guard-rspec", require: false
end
