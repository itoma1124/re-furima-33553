class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_address_params
    @item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :province_id, :city, :address_line, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
