class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  
# お気に入り登録
  def create
    if @post.user_id != current_user.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
    end
  end
  
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end
  

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end


end
