class PagesController < ApplicationController
  def index
    @latest_products = Product.all.order(created_at: :desc).limit(12)
    @categories = Category.all.limit(12)
    @stores = Store.all.order(created_at: :desc).limit(2)
    @latest_shop = Store.all.order(created_at: :desc).limit(3)

    @featured_store = Store.all.limit(1)
  end


  def sell
  end


  def about
  end
  
end
