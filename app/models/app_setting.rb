class AppSetting < ApplicationRecord
  mount_uploader :logo, ImageUploader

  def logo_url
    return logo.url unless AppSetting.last.dummy_image

    "/ashion/img/logo.png"
  end
end