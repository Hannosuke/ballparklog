# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def user
        user = User.find(2)
        UserMailer.send_mail(user)
    end
end
