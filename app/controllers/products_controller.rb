class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
    5.times { @product.assets.build }
  end

  def show
  end

  def search
    @products = Product.search(params)
  end

  def create
    @product = Product.new(product_params)
    @product.store_id = current_user.store.id
    respond_to do |format|
      if @product.save
        params[:assets]['image'].each do |a|
          @asset = @product.assets.create!(:image => a)
       end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    5.times { @product.assets.build }
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product/1
  # DELETE /product/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :store_id, :stock, :category_id, :image,  assets_attributes: [:id, :pproduct_id, :image])
    end
end
