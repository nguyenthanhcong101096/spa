class CreateOrderService
  def self.call(params)
    new(params).execute
  end

  def initialize(params)
    @params = params
    @order  = Order.new
  end

  def execute
    @order.assign_attributes(order_details)
    
    return false unless @order.valid?

    @order.save!
    create_order_products(@order.reload)
    true 
  end

  private

  def order_details
    @params.slice(:full_name, :address, :phone, :note).as_json
  end

  def create_order_products(order)
    arr_product = JSON.parse(@params[:products])

    arr_product.group_by { |i, v| i['id']}.map do |id, value|
      product     = Product.find(id)
      quantity    = value.size
      total_price = product.amount * quantity

      order.order_products.create(
        product_id: product.id,
        quantity: quantity,
        price: product.amount,
        total_price: total_price
      )
    end
  end
end