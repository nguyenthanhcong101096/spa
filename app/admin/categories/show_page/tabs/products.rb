module ProductTab
  def product_tab_code
    tab 'Sản Phẩm' do
      span { link_to("Thêm sản phẩm mới", new_admin_product_path, method: :get, class: 'button') }

      category.products.map do |record|
        panel record.name do
          attributes_table_for record do
            row :name
            row :image do |product|
              image_tag(product.image_url.to_s, height: '200', width: '200')
            end
          end
        end
      end
    end
  end

  def self.extended(base)
    base.instance_eval(&:product_tab_code)
  end
end
