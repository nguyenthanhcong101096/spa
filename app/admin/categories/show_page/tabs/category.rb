module CategoryTab
  def category_tab_code
    tab 'Danh mục' do
      attributes_table do
        row :name
        row :describe
        row :active
        row :image do |cate|
          image_tag(cate.image.url.to_s, height: '200', width: '300')
        end
        row :created_at
        row :updated_at
      end
    end
  end

  def self.extended(base)
    base.instance_eval(&:category_tab_code)
  end
end
