class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_item, only: [:index, :create, :show]
  before_action :check_order, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
       pay_item
       @order_buyer.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
  params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def find_item
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_order
    if user_signed_in?
      if @item.order.present? || current_user == @item.user
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
