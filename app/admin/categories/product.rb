ActiveAdmin.register Product do
  menu parent: ["Categories"]
  
  permit_params :name, :image, :category_id, :price, :describe, :discount, :discount_percent

  filter :category, label: 'Category'
  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :image do |product|
      image_tag(product.image_url.to_s, height: '100', width: '100')
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :image do |product|
        image_tag(product.image_url.to_s, height: '100', width: '100')
      end
      row :created_at
      row :updated_at
    end
  end

  sidebar "Details", only: :show do
    attributes_table_for Product.first do
      row :number_order
      row :publisher
    end
  end
end
