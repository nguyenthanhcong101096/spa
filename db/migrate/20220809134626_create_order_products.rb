class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.bigint :order_id
      t.bigint :product_id
      t.integer :quantity
      t.decimal :price
      t.decimal :total_price

      t.timestamps
    end
  end
end
