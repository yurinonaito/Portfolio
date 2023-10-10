class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create(user_id: current_user.id)
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    # @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    @entry2 = Entry.create(room_id: @room.id, user_id: params[:user_id])
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new
      @entries = @room.entries
    else
      room_id = Entry.where(user_id: current_user.id).pluck(:room_id).first
      redirect_to room_path(room_id)
    end
  end
end
