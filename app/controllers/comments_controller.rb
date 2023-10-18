class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :destroy]
  
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = post.id
    @comment.save
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
  def ensure_guest_user
      if current_user.email == "guest@example.com"
        redirect_to root_path , notice: "ゲストユーザーはこの機能はご使用いただけません。"
      end
  end
  
end
