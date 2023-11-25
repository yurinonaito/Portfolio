class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :destroy]
  
  def create
    if @post.user_id != current_user.id   # 投稿者本人以外に限定
      Favorite.create(user_id: current_user.id, post_id: @post.id)
    end
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    if favorite.present?
       favorite.destroy
    end
  end
  

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to root_path , notice: "ゲストユーザーはこの機能はご使用いただけません。"
    end
  end


end
