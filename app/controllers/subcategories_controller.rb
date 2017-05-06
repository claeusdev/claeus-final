class SubcategoriesController < ApplicationController
  def index
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end
end
