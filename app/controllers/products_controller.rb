class ProductsController < ApplicationController
  def index
    @products = Product.with_category(params[:code])
  end

  def cart
  end

  def checkout
  end

  def show
    @product = Product.find(params[:id])
  end
end
