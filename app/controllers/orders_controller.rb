class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_buyer = OrderBuyer.new
  end

  private

  def order_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number)
  end

end
