class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user=User.find(params[:id])
    @posts = @user.posts
    
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Post.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
    
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    
    unless @user.id == current_user.id
           @current_entry.each do |current|
             
             @another_entry.each do |another|
              if current.room_id == another.room_id
                     @is_room = true
                     @room_id = current.room_id
              end
             end
             
           end
           
    unless @is_room
           @room = Room.new
           @entry = Entry.new
    end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       flash[:notice] = "変更を保存しました"
       redirect_to user_path(current_user.id)
    else
       render :edit
    end
  end

  def confirm_withdraw
  end

  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update
    #セッション情報を全て削除
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    #退会後トップ画面に遷移
    redirect_to root_path
  end
  
  def release
    @user =  User.find(params[:id])
    @user.released! unless @user.released?
    redirect_to  "/users/#{@user.id}/edit", notice: 'このアカウントを公開しました'
  end

  def nonrelease
    @user =  User.find(params[:id])
    @user.nonreleased! unless @user.nonreleased?
    redirect_to "/users/#{@user.id}/edit", notice: 'このアカウントを非公開にしました'
  end
  
  def favorites
    @user = current_user
    favorite_posts = @user.favorites.pluck(:post_id)
    @favorite_posts = Post.where(id: favorite_posts)
    @favorite_posts_none = "いいね した投稿がありません。"
  end

  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path, notice: "You cannot move to other people's screens."
    end
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :user_name, :icon_image, :telephone_number, :email, :password)
  end
  
end
