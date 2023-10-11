class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    
    if @range == "User"
       @users = User.looks(params[:search], params[:word])
    else
       @posts = Post.where("caption LIKE ?", "%#{params[:word]}%")
    end
  
    
    if params[:q].present? && !params[:q].empty?
       # 検索クエリが提供された場合の処理
       @tag = params[:q]
       hashtag = Hashtag.find_by(hashname: params[:q])
       @posts = hashtag ? hashtag.posts : []
    else
       # 検索クエリが提供されなかった場合の処理
       @posts = []  # 空の配列を代入
       @tag = "no post"
    end
  end
  
end
