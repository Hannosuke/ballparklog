class UserMailer < ApplicationMailer
    
    def send_mail
        @user = params[:user]
        mail to: @user.email, subject: "パスワード再設定はこちら"
    end
end