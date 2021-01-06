class LikesController < ApplicationController
    def create
        @like = Like.new(
            user_id: current_user.id,
            ballpark_log_id: params[:ballpark_log_id]
        )
        @like.save
        flash[:notice] = "Liked"
        redirect_to("/")
    end

    def destroy
        @like = Like.find_by(
            user_id: current_user.id,
            ballpark_log_id: params[:ballpark_log_id]
        )
        @like.destroy
        redirect_to("/")
    end
end