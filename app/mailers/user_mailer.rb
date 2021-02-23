class UserMailer < ApplicationMailer
    default from: "notification@example.com"
    
    def reset_password_email
        @user = User.find(params[:id])
        mail(to: @user.email, subject: "私の素敵なサイトへようこそ")
    end
end
