class LikesController < ApplicationController
    def create
        @like = Like.new(
            user_id: current_user.id,
            ballpark_log_id: params[:ballpark_log_id]
        )
        @like.save
        redirect_to("/")
    end
end