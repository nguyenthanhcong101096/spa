module ProductsHelper
  def product_json(product)
    product.slice(:id, :name).merge({
      price: product.amount,
      original_price: product.price.to_f,
      discount: product.discount.to_s
    })
  end
end
