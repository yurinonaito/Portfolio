class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @mutual_followings = current_user.mutual_followings
  end
  
end
