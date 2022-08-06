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
      t.integer :width_logo, default: 50
      t.integer :height_logo, default: 50
      t.boolean :dummy_image, default: false #only for development

      t.timestamps
    end
  end
end
