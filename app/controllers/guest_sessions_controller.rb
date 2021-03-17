class GuestSessionsController < ApplicationController
    def create
        user = User.find_by(email: "guest_user@example.com")
        session[:user_id] = user.id
        flash[:notice] = "ゲストユーザーでログインしました"
        redirect_to("/")
    end
    
end
