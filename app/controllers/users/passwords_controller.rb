# frozen_string_literal: true

class Users::PasswordsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user.password_reset_token = SecureRandom.urlsafe_base64
    if @user.present? && @user.save(validate: false)
      UserMailer.with(user: @user).send_mail.deliver_now
      flash[:notice] = "パスワード再設定のメールを送信しました"
      redirect_to(login_path)
    else
      @error = "メールアドレスが間違っています"
      render :new
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:password_reset_token])
  end

  def update
    @user = User.find_by(password_reset_token: params[:password_reset_token])
    if @user.update(password_params)
      flash[:notice] = "パスワードの再設定が完了しました"
      redirect_to(login_path)
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :password_reset_token)
  end
end
