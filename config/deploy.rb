# frozen_string_literal: true
set :application, "goalgame"
set :repo_url, "git@gitlab.com:goalgame/goalgame.git"

set :deploy_to, "/home/deploy/goalgame"

set :linked_files, %w(config/database.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)

# Default value for keep_releases is 3
set :keep_releases, 3

namespace :deploy do
  before :updated, :copy_database_config do
    on roles(:all) do
      within release_path do
        execute :cp, "#{release_path}/config/database.yml.example #{shared_path}/config/database.yml"
        execute :rake, "db:create RAILS_ENV=#{fetch(:stage)}"
        execute :rake, "db:migrate RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  before :published, :set_db_seed do
    on roles(:all), in: :sequence do
      within release_path do
        execute :rake, "db:seed RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  after :published, :restart do
    on roles(:all), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end
end
