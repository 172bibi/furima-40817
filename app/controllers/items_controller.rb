class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :item, :explanation, :category_id, :situation_id, :deliverycharge_id, :region_id, :deliveryday_id, :price).merge(user_id: current_user.id)
  end

end
