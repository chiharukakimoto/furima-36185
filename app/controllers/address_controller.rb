class AddressController < ApplicationController
  def index
    @order = AddressForm.new
  end

  def create
    @address = AddressForm.new(set_params)
    if @address.valid?
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def set_params
    params.require(:address).permit(:post_cord, :prefecture_id, :city, :house_number, :building_name, :phone)
  end
end
