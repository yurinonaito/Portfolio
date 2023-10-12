class ChatsController < ApplicationController
 before_action :authenticate_user!, only: [:create]
 
  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless entries.nil?
      @room = entries.room
    else
      @room = Room.new
      if @room.save
        Entry.create(user_id: current_user.id, room_id: @room.id)
        Entry.create(user_id: @user.id, room_id: @room.id)
      else
        # チャットルームの作成に失敗した場合の処理
      end
    end
    
    @chat = @room.chats.build(user_id: current_user.id)
    @chats = @room.chats.order(created_at: :desc)
    @entries = @room.entries
  end
 
  def create
     if Entry.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
       @chat = Chat.new(params.require(:chat).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
      
       if @chat.save
        # チャットの保存に成功した場合の処理
       else
         flash[:alert] = "メッセージ送信に失敗しました。"
       end
         redirect_to "/rooms/#{params[:chat][:room_id]}"
     end
  end
  
    private
  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end

end
