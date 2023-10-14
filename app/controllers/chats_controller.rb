class ChatsController < ApplicationController
  before_action :reject_non_related, only: [:show]
  
  
  def show
    @user = User.find(params[:id])
    # ログインユーザーと表示中のユーザーの双方のエントリを取得
    current_user_entries = current_user.entries
    user_entries = @user.entries
  
    # 共通のルームIDを探します
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
  end

  private
  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to posts_path
    end
  end
end

