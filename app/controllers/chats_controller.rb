class ChatsController < ApplicationController
 before_action :authenticate_user!, only: [:create]
 
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
end
