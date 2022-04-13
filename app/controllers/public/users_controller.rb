class Public::UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

end
