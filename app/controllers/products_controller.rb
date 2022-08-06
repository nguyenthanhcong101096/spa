class ProductsController < ApplicationController
  PER_PAGE = 9

  def index
    @products = Product.search_by(params[:q])
                       .with_category(params[:code])
                       .page(params[:page])
                       .per(PER_PAGE)
  end

  def cart
  end

  def checkout
  end

  def show
    @product = Product.find(params[:id])
  end
end
