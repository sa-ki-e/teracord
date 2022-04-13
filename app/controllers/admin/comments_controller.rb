class Admin::CommentsController < ApplicationController
  def destroy
    #binding.pry
    Comment.find(params[:id]).destroy
    redirect_to admin_posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
