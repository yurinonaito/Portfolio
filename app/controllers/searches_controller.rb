class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    
    if @range == "User"
       @users = User.looks(params[:search], params[:word])
    else
       @posts = Post.where("caption LIKE ?", "%#{params[:word]}%")
    end
  
    
    if params[:q].empty?
      @post = Post.all
      @tag ="なし"
    else
      @tag = params[:q]
      hashtag = Hashtag.find_by(hashname: params[:q])
      @posts = hashtag ? hashtag.posts : []
    end
  end
  
end
