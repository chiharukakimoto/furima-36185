class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid? 
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

#  def create
#    @order = Order.new(order_params)
#    if @order.valid?
#      pay_item
#      @order.save
#      redirect_to root_path
#    else
#      render :index
#    end
#  end

  private
  
  def order_params
    params.require(:order_address).permit(:post_cord, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: [:item_id])
  end

  #def order_params
    #params.require(:order).permit(:price).merge(token: params[:token])
  #end

  #def pay_item
    #Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    #Payjp::Charge.create(
    #  amount: order_params[:price],
    #  card: order_params[:token],
    #  currency: 'jpy'
    #  )
  #end
end
