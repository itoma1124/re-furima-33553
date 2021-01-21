class FavoritesController < ApplicationController
  def create
    if @item.user_id != current_user.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(favorite_params)
    end
  end

  def destory
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destory
  end

  private
  def favorite_params
    params.require(:favorite).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
