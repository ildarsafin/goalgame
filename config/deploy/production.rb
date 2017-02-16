set :port, 22
set :user, "deploy"
set :deploy_via, :remote_cache
set :use_sudo, false

set :branch, "master"

set :stage, :production
set :rails_env, :production
set :rack_env, :production

server "95.213.252.179",
  roles: %w(web app),
  port: fetch(:port),
  user: fetch(:user),
  auth_methods: %w(publickey)
