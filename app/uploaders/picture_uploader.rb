class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{Rails.env}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process resize_to_fill: [1280, 1024]

  version :thumb do
    process resize_to_fill: [500, 500]
  end
end
