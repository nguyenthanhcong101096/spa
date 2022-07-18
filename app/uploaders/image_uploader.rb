# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # process resize_to_fit: [250, 250]

  # storage :file

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
    0..5.megabytes
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # version :small do
  #   process resize_to_fill: [200, 200]
  # end
end
