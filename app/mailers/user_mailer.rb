class UserMailer < ApplicationMailer
  default from: Rails.application.credentials[:GMAIL_ADDRESS]

  def send_mail
    @user = params[:user]
    mail to: @user.email, subject: "パスワード再設定はこちら"
  end
end
