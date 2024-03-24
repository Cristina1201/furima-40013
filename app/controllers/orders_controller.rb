class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_item, only: [:index, :create, :show]

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render  :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
  params.require(:order_buyer).permit(:post_code, :ship_from_location_id, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  
  
  
  def find_item
    @item = Item.find(params[:item_id])
  end
end
