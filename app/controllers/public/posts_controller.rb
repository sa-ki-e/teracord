class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    #@post_comment = PostComment.new#コメントを投稿するためのインスタンス変数
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :caption, :user_id, :genre_id)
  end
  
  
  
end