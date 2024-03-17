class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :comment, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :estimated_shipping_id, :price).merge(user_id: current_user.id)
  end

 end
