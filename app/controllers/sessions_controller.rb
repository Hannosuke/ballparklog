# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :forbid_login_user, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error = "メールアドレスまたはパスワードが間違っています"
      @email = session_params[:email]
      @password = session_params[:password]
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
