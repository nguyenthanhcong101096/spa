class ProductsController < ApplicationController
  def index
  end

  def cart
  end

  def checkout
  end

  def show
    @product = Product.find(params[:id])
  end
end
