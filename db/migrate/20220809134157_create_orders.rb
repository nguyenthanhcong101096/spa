class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :full_name, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :email
      t.string :note
      t.boolean :delivery, default: false

      t.timestamps
    end
  end
end
