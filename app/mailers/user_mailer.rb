class UserMailer < ApplicationMailer
    default from: "notification@example.com"

    def creation_email
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: '私の素敵なサイトへようこそ')
    end
end
