class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @order_address = OrderAddress.create(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.merge(user_id: current_user.id, item_id:@item.id )
  end

  def address_params(order)
    params.permit(:postal_code, :province_id, :city, :address_line, :building, :phone_num).merge(user_id: current_user.id, order_id: order.id)
  end

end
