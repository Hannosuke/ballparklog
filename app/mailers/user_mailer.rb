class UserMailer < ApplicationMailer
    default from: credentials[:GMAIL_ADDRESS]
    
    def send_mail
        @user = params[:user]
        mail to: @user.email, subject: "パスワード再設定はこちら"
    end
end