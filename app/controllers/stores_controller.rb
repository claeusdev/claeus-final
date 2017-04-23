class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def dashboard
    @store = current_user.store
    @product = Product.new
    5.times { @product.assets.build }
  end

  def new
    @store = Store.new
  end


  def show
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id
    if @store.save
      respond_to do |format|
        if @store.save
          format.html { redirect_to dashboard_stores_path, notice: 'Store was successfully created.' }
          format.json { render :show, status: :created, location: @store }
        else
          format.html { render :new }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
      respond_to do |format|
        if @store.update(store_params)
          format.html { redirect_to @store, notice: 'Store was successfully updated.' }
          format.json { render :show, status: :ok, location: @store }
        else
          format.html { render :edit }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /stores/1
    # DELETE /stores/1.json
    def destroy
      @store.destroy
      respond_to do |format|
        format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
        format.json { head :no_content }
      end
    end




  private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :description, :tagline, :user_id)
    end
end
