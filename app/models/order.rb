class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  def delivery_status_change
    if delivery == 'not_delivery'
      'delivery'
    elsif delivery == 'delivery'
      'delivery_done'
    end
  end
end