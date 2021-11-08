class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    binding.pry
    if current_user.id == @item.user.id && @item.order
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
  if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
  else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:post_cord, :prefecture_id, :city, :house_number, :building_name, :phone ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end