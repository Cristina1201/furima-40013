class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
 end
