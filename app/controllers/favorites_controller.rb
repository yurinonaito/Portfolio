class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  
  # def create
  #   @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])#user_idには、ログイン中のユーザーidを指定
  #   @post_favorite.save
  # end
  
  # def destroy
  #   @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])  #find_byメソッド id(主キー)か不明で別の条件でレコードを検索したい場合
  #   @post_favorite.destroy
  # end
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
