ActiveAdmin.register Product do
  menu parent: ["Categories"]
  
  permit_params :name, :image, :category_id

  filter :category, label: 'Category'
  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

end
