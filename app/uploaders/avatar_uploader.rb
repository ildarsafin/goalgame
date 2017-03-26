class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process resize_to_fill: [800, 800]

  version :thumb do
    process resize_to_fill: [500, 500]
  end

  version :small_thumb do
    process resize_to_fill: [200, 200]
  end
end
