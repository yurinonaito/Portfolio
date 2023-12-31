class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create]
  before_action :reject_non_related, only: [:show]
  
  
  def show
    @user = User.find(params[:id])
    # ログインユーザーと表示中のユーザーの双方のエントリを取得
    current_user_entries = current_user.entries
    user_entries = @user.entries
  
    # 共通のルームIDを探します
    # &. = オブジェクト（first）がnilである場合にもエラーを発生させずに安全にアクセスするためのセーフナビゲーション演算子
    common_room = current_user_entries.joins(:room).where(rooms: { id: user_entries.pluck(:room_id) }).first&.room

  
    if common_room
      @room = common_room
    else
      # 共通のルームがない場合、新しいルームを作成しエントリを作成
      @room = Room.create(user_id: current_user.id)

      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
      @entries = @room.entries
    end
    
    @entries = @room.entries
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    render :validater unless @chat.save
    #チャットの保存に失敗した場合に限りバリデーションを返す
  end
  

  private
  
  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
        redirect_to user_path(user.id), notice: "相互フォローになるとDMがご使用いただけます"
    end
  end
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to root_path, notice: "ゲストユーザーはこの機能はご使用いただけません。"
    end
  end
  
end

