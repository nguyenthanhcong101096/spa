class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  delegate :id, :image, :name, :price, to: :product, allow_nil: true, prefix: true
  delegate :full_name, :phone, :address, :note, to: :order, allow_nil: true, prefix: true
end