class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to(ballpark_log_path(@comment.ballpark_log_id))
  end

  private

  def comment_params
    params.permit(:content, :user_id, :ballpark_log_id)
  end
end