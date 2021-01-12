class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :unmach_user, only: [:edit,:update]

  def index
    @items = Item.all
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :fare_id, :province_id, :shipment_day_id,
                                 :price)
          .merge(user_id: current_user.id)
  end

  def unmach_user
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
