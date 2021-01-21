class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :sold_out,only:[:edit,:update]
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    if user_signed_in?
      gon.current_user = current_user.nickname
      gon.item_user = @item.user.nickname
    end
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :fare_id, :province_id, :shipment_day_id,
                                 :price)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def unmach_user
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out
    if @item.order.present?
      redirect_to root_path
    end
  end

end
