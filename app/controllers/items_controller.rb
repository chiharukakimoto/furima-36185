class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :without_index, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.all.order("created_at DESC")
    @order_address = OrderAddress.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
      @order_address = OrderAddress.new
    end

  def edit
    if current_user.id == @item.id || @item.order != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    if current_user = @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :item_info, :category_id, :status_id, :delivery_fee_id, :delivery_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def without_index
    if current_user != @item.user
      redirect_to root_path
    end
  end
end