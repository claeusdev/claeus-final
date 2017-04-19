class PagesController < ApplicationController
  def index
    @latest_products = Product.all.order(created_at: :desc)
  end

  def sell
  end

  def about
  end
end
