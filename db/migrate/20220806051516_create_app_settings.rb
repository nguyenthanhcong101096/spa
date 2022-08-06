class CreateAppSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :app_settings do |t|
      t.text :logo
      t.string :title
      t.string :description
      t.string :address
      t.string :phone
      t.string :email
      t.string :google_map
      t.integer :width_logo
      t.integer :height_logo

      t.timestamps
    end
  end
end
