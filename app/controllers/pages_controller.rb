class PagesController < ApplicationController
  def index
  end

  def contact
  end

  def not_found
    render json: {a: '1'}
  end
end
