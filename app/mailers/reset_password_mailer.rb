class UserMailer < ApplicationMailer
    default from: "notification@example.com"
    
    def send_mail
        @user = User.find(params[:id])
        mail to: @user.email, subject: "パスワード再設定はこちら"
    end
end
