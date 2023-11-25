class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    @users = []
    @posts = []
    @tag = params[:word]
    
    if @range == "User"
       @users = User.looks(params[:search], params[:word]).where.not(status: "nonreleased")
    else
       @posts = Post.where("caption LIKE ?", "%#{params[:word]}%").where.not(user: User.where(status: "nonreleased"))
       # キャプション（caption）が指定のキーワードを含む投稿を検索
    end
  
       # ハッシュタグ検索
    if params[:q].present? && !params[:q].empty?
       # 検索クエリが提供された場合の処理
       @tag = params[:q]
       hashtag = Hashtag.find_by(hashname: params[:q])
       @posts = hashtag ? hashtag.posts : []
    end
  end
  
end
