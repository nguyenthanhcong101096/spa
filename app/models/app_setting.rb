class AppSetting < ApplicationRecord
  mount_uploader :logo, ImageUploader
end