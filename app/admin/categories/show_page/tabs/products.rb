module ProductTab
  def product_tab_code
    tab 'Sản Phẩm' do
      span { link_to("Thêm sản phẩm mới", new_admin_product_path, method: :get, class: 'button') }

      category.products.map do |record|
        panel record.name do
          attributes_table_for record do
            row :id
            row :name
          end
        end
      end
    end
  end

  def self.extended(base)
    base.instance_eval(&:product_tab_code)
  end
end
