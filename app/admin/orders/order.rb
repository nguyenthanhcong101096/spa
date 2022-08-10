ActiveAdmin.register Order do
  config.filters = false
  menu :priority => 2

  actions :index, :show

  member_action :delivery, method: :post do
    Order.find_by(id: params[:id]).update(delivery: params['status'])
    redirect_to admin_order_path(params[:id]), notice: 'Đơn hàng đã được xử lý'
  end

  scope :not_delivery, :default => true do |order|
    order.where(delivery: 'not_delivery')
  end

  scope :delivery do |order|
    order.where(delivery: 'delivery')
  end

  scope :delivery_done do |order|
    order.where(delivery: 'delivery_done')
  end

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
    columns do
      column do
        para "Thông tin đơn hàng"
        attributes_table do
          row :full_name 
          row :address
          row :phone
          row :note
          row :created_at
          row :total_price do |record|
            number_to_currency(record.order_products.sum(:total_price), unit: "VNĐ", separator: ",", delimiter: ".", format: "%n %u")
          end
          row :delivery_status do |record|
            record.delivery
          end
        end
        
        span { link_to('Quay lại', admin_orders_path, method: :get, class: 'button') }

        unless order.delivery == 'delivery_done'
          message = order.delivery == 'not_delivery' ? 'Xử lý đơn hàng' : 'Xử lý xong đơn hàng'

          span { link_to(message, delivery_admin_order_path(id: order.id, status: order.delivery_status_change), method: :post, class: 'button') }
        end
      end

      column do
        para "Sản phẩm"

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
  end
end
