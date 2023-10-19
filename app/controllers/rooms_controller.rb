class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @rooms = Room.where(user_id: current_user.id)
  end

  def show
    
    @mutual_followings = current_user.mutual_followings
  end
end
