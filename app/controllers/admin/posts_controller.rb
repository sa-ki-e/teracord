class Admin::PostsController < ApplicationController
before_action :set_post, only: [:show, :destroy]
  def index
    @posts = Post.all
  end
  
  def show
    @user = @post.user
    @comment = Comment.new
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end
  
  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :caption, :user_id, :genre_id, :image)
  end
end
