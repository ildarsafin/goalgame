# frozen_string_literal: true
# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

require "capistrano/bundler"

require "capistrano/rails/migrations"
require "capistrano/rails/assets"

# If you are using rbenv add these lines:
require "capistrano/rbenv"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, "2.4.0"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
