class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category

  scope :with_category, -> (category_code = '') { 
    return all if category_code.blank?
    
    joins(:category).where('categories.code = ?', category_code)
   }

  def self.search_by(keyword)
    return all if keyword.blank?
  
    where("products.name LIKE :keyword", keyword: "%#{keyword}%")
  end

  def image_url
    image.url
  end

  def discount_price
    return 0 unless discount
    
    total = price - ((discount_percent / 100.0 ) * price)

    total
  end
end