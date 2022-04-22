class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # def new
  #   @post = Post.new
  # end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to posts_path, notice: '投稿が完了しました'
    else
      redirect_to posts_path, notice: '投稿ができませんでした'
    end
  end

  def index
    @post_new = Post.new#モーダル表示用
    @posts = Post.all
  end

  def show
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    if @post.user == current_user
      render "edit"
    else
      redirect_to post_path(@post.id)
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました'
  end

  def search
  @searches = Post.search(params[:keyword])
  @post_new = Post.new#モーダル表示用
  #@genre = Genre.find(params[:id])#
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :caption, :user_id, :genre_id, :image)
  end

  # def genre_params
  #   params.require(:genre).permit(:name)#
  # end

end