def show_widget(widget, name)
  extend "#{name} #{widget}".to_s.titleize.tr(' ', '').classify.constantize
end

ActiveAdmin.register Category do
  menu :priority => 3
  
  filter :name

  permit_params :name, :code, :image, :describe, :active
  
  # scope :pending, default: true
  # scope :approved

  action_item :method_get, only: [:index] do
    link_to('METHOD GET', method_get_admin_categories_path)
  end

  collection_action :method_get, method: :get do
    @a = 'HOAL'
    render 'admin/categories/method_get', locals: {a: 'hola'}
  end
  index do
    selectable_column
    id_column
    column :name
    column :code
    column :created_at
    column :updated_at
    actions
  end

  show do
    tabs do
      show_widget :tab, 'Category'
      show_widget :tab, 'Product'
      show_widget :tab, 'Actions'
    end
  end
end
