class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @room = Room.find(params[:id])
    @mutual_followings = current_user.mutual_followings
    
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new
      @entries = @room.entries
    else
      room_id = Entry.where(user_id: current_user.id).pluck(:room_id).first
      
    end
  end
end
