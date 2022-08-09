ActiveAdmin.register Order do
  config.filters = false

  actions :index, :show, :edit, :update

  index do
    selectable_column

    column :full_name
    column :address
    column :phone
    actions
  end

  form do |f|
    f.inputs do
      f.input :full_name 
      f.input :address
      f.input :phone
      f.input :note
      f.input :description
      f.input :created_at
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name 
      row :address
      row :phone
      row :note
      row :created_at
      row :total_price do |record|
        number_to_currency(record.order_products.sum(:total_price), unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
      end
    end

    tabs do 
    end

    order.order_products.map do |record|
      panel record.product_name do
        attributes_table_for record do
          row :name do
            link_to(record.product_name, admin_product_path(record.product_id))
          end

          row :image do |record|
            image_tag(record.product_image.url.to_s, height: '200', width: '300')
          end

          row :price do |record|
            number_to_currency(record.price, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
          end

          row :quantity

          row :total_price do |record|
            number_to_currency(record.total_price, unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
          end
        end
      end
    end
  end
end
