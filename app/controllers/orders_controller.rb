class OrdersController < ApplicationController
  def index
  end

  def create
    create_order = CreateOrderService.call(params)

    redirect_to orders_path if create_order
  end
end
