class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @stores = @user.stores.find(params[:id])
  end
end
