class Category < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :products, dependent: :destroy

  def image_url
    dummy = AppSetting.last.dummy_image

    return image.url.to_s unless dummy

    "/ashion/img/categories/#{rand(1..5)}.png"
  end
end