class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :image
      t.bigint :category_id

      t.timestamps
    end
  end
end
