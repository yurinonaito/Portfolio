class HomesController < ApplicationController
  def top
     @posts = Post.order('id DESC').limit(9)
  end

  def about
  end

end
