# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        para "Đơn hàng đợi xử lý"
        panel "Orders" do
          ul do
            Product.all.map do |product|
              li link_to(product.name, admin_product_path(product))
            end
          end

          span { link_to("See all", admin_products_path, method: :get, class: 'button') }
        end
      end

      column do
        para "Đơn hàng đã được xữ lý"

        panel "Deliveries" do
          ul do
            Product.all.map do |product|
              li link_to(product.name, admin_product_path(product))
            end
          end

          span { link_to("See all", '/', method: :get, class: 'button') }
        end
      end
    end
  end
end
