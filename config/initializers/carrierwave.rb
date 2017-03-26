CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.fog_credentials = {
      provider: "OpenStack",
      openstack_username: ENV["OPENSTACK_LOGIN"],
      openstack_api_key: ENV["OPENSTACK_API_KEY"],
      openstack_auth_url: ENV["OPENSTACK_AUTH_URL"]
    }

    config.permissions = 0600
    config.directory_permissions = 0700

    config.storage = :fog
    config.fog_directory = "GoalGame"

    config.fog_attributes = { "Cache-Control" => "max-age=315576000" }
    config.fog_public     = true
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
