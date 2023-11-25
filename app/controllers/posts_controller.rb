class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:new, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :teachme, :destroy, :is_matching_login_user]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
       flash[:notice] = "Successfully"
       redirect_to posts_path
    else
       flash.now[:notice] = "Could not post"
       render :new
    end
  end
  
  
  def index
    @posts =  Post.where.not(user: User.where(status: "nonreleased")).order('id DESC')
  end
  

  def show
    @comment = Comment.new
  end
  

  def edit
  end
  
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  
  def update
    if @post.update(post_params)
       flash[:notice] = "Successfully"
       redirect_to post_path(@post.id)
    else
       flash.now[:notice] = "Could not update"
       render :edit
    end
  end
  
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end
  
  
  def teachme
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
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def is_matching_login_user
    unless post.user_id == current_user.id
           redirect_to root_path, notice: "You cannot move to other people's screens."
    end
  end
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
       redirect_to root_path , notice: "ゲストユーザーはこの機能はご使用いただけません。"
    end
  end  
  
end
