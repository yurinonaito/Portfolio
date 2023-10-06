class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to users_mypage_path
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

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :user_name, :icon_image, :telephone_number, :email, :password)
  end

end
