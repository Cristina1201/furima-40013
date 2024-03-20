class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description , :category_id, :condition_id, :postage_id , :ship_from_location_id, :shipping_day_id , :price).merge(user_id: current_user.id)
  end

 end
