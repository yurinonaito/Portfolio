class HomesController < ApplicationController
  
  def top
     @posts = Post.where.not(user: User.where(status: "nonreleased")).order('id DESC').limit(9)
  end

  def about
  end

end
