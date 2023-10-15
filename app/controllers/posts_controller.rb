class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       flash[:notice] = "投稿に成功しました。"
       redirect_to posts_path
    else
       flash.now[:notice] = "投稿に失敗しました。"
       render :new
    end
  end
  
  def index
    @posts =  Post.where.not(user: User.where(status: "nonreleased"))
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       flash[:notice] = "更新に成功しました。"
    else
       flash.now[:notice] = "更新に失敗しました。"
       redirect_to post_path(@post.id)
    end
  end
  
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end
  
  
  def teachme
    @post = Post.find(params[:id]) # 対応する投稿を取得

    if @post
      # Teachme カウントを増加
      @post.increment!(:teachmes_count)
    end
      redirect_to @post.code_url
  end
  
  private

  def post_params
    params.require(:post).permit(:caption, :image, :post_url, :code_url)
  end
  
end
