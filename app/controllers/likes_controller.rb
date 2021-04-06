# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user

  def create 
    @ballpark_log = BallparkLog.find(params[:ballpark_log_id])
    @like = Like.new(
      user_id: current_user.id,
      ballpark_log_id: @ballpark_log.id
    )
    @like.save
  end

  def destroy
    @ballpark_log = BallparkLog.find(params[:ballpark_log_id])
    @like = Like.find_by(
      user_id: current_user.id,
      ballpark_log_id: @ballpark_log.id
    )
    @like.destroy
  end
end
