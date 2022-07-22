class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category

  scope :with_category, -> (category_code = '') { 
    return all if category_code.blank?
    
    joins(:category).where('categories.code = ?', category_code)
   }

  def image_url
    image.url
  end

  def discount_price
    return "VND 0" unless discount
    
    total = price - ((discount_percent / 100.0 ) * price)

    "VND #{total}"
  end

  def amount
    "VND #{price}"
  end
end