# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        para "Đơn hàng đợi xử lý"
        panel "Not Delivery" do
          render partial: 'admin/dashboard/order'

          span { link_to("See all", admin_orders_path(scope: 'not_delivery'), method: :get, class: 'button') }
        end
      end

      column do
        para "Đơn hàng đang vận chuyển"

        panel "Delivering" do
          ul do
            Order.order(id: :desc).where(delivery: 'delivery').map do |product|
              li link_to("#{product.code} - #{product.full_name}", admin_product_path(product))
            end
          end

          span { link_to("See all", admin_orders_path(scope: 'delivery'), method: :get, class: 'button') }
        end
      end
    end
  end
end
