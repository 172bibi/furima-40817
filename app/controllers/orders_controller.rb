class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :prohibit_purchase, only: [:index, :create]

  def index
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
     @orderform.save
     redirect_to root_path
    else
     render :index, status: :unprocessable_entity
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
   params.require(:order_form).permit(:postcode, :region_id, :municipalities, :streetaddress, :buildingname, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def prohibit_purchase
    redirect_to root_path if current_user.id == @item.user_id
  end
end