class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :image
      t.bigint :category_id
      t.decimal :price
      t.boolean :discount, default: false
      t.integer :discount_percent, default: 0
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
