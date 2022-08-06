ActiveAdmin.register AppSetting do
  config.filters = false

  actions :index, :show, :edit, :update

  permit_params :email, :phone, :address, :logo, :width_logo, :height_logo, :google_map, :title, :description

  index do
    selectable_column
    column :logo do |app|
      image_tag(app.logo.url.to_s, height: "#{app.height_logo}px", width: "#{app.width_logo}px")
    end
    column :title
    column :description
    column :email
    column :phone
    column :address
    actions
  end

  form do |f|
    f.inputs do
      f.input :logo 
      f.input :width_logo
      f.input :height_logo
      f.input :title
      f.input :description
      f.input :email
      f.input :phone
      f.input :address
      f.input :google_map
    end
    f.actions
  end

  show do
    attributes_table do
      row :logo do |app|
        image_tag(app.logo.url.to_s, height: "#{app.height_logo}px", width: "#{app.width_logo}px")
      end
      row :title
      row :description
      row :email
      row :phone
      row :address
      row :google_map
    end
  end
end
