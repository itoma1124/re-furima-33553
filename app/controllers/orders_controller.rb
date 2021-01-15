class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :set_item
before_action :mach_user
before_action :sold_out

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :province_id, :city, :address_line, :building, :phone_num)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def mach_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out
    if @item.order.present?
      redirect_to root_path
    end
  end
end
