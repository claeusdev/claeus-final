class PagesController < ApplicationController
  def index
    @latest_products = Product.all.order(created_at: :desc).limit(1)
    @categories = Category.all.limit(12)

    @latest_shop = Store.all.order(created_at: :desc).limit(1)
  end

  def sell
  end

  def about
  end
end
