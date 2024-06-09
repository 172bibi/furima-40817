class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path , status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :explanation, :category_id, :situation_id, :deliverycharge_id, :region_id, :deliveryday_id, :price).merge(user_id: current_user.id)
  end

end
