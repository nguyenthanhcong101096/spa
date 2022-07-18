module CategoryTab
  def category_tab_code
    tab 'Danh mục' do
      attributes = %i[code name created_at updated_at]

      attributes_table(*attributes)
    end
  end

  def self.extended(base)
    base.instance_eval(&:category_tab_code)
  end
end
