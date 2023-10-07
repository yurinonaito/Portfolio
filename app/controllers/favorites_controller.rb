class FavoritesController < ApplicationController
  
  def create
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])#user_idには、ログイン中のユーザーidを指定
    @post_favorite.save
    redirect_to post_path(params[:post_id]) 
  end
  
  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])  #find_byメソッド id(主キー)か不明で別の条件でレコードを検索したい場合
    @post_favorite.destroy
    redirect_to post_path(params[:post_id]) 
  end



end
