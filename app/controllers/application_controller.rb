class ApplicationController < ActionController::Base
    before_action do
        request.variant = :sp if request.user_agent =~ /iPhone|Android/
    end

    helper_method :current_user

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate_user
        redirect_to "/login", notice: "ログインが必要です" if current_user.blank?
    end

    def forbid_login_user
        redirect_to root_path, notice: "すでにログインしています" if current_user
    end
end
