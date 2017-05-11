class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store

  def create
    current_user.follow(@store)
    redirect_to @store
  end

  def destroy
    current_user.unfollow(@store)
    redirect_to @store
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end
end
