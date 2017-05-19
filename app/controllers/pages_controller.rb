class PagesController < ApplicationController
  def index
    @latest_products = Product.all.order(created_at: :desc).limit(12)
    @categories = Category.all.limit(12)
    @latest_stores = Store.all.order(created_at: :desc).limit(3)
    @store = Store.all
    @featured_store = Store.all.limit(1)
  end


  def sell
  end


  def about
  end

  def contact

  end

  def terms

  end

  def privacy

  end

  def support

  end

  def blog

  end

  def advertise

  end

end
