class Users::PasswordsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present? && @user.update(password_reset_token: SecureRandom.urlsafe_base64)
            UserMailer.send_mail.deliver_now
            flash[:notice] = "パスワード再設定のメールを送信しました"
            redirect_to(login_path)
        else
            flash.now[:alert] = 'メールアドレスが間違っています'
            render :new
        end
    end

    def edit
        @user = User.find_by(password_reset_token: params[:password_reset_token])
    end

    def update
        if @user = User.update(password_params)
            flash[:notice]
            redirect_to(login_path)
        else
            render :edit
        end
    end



    


    private

    def password_params
        parms.require(:user).permit(:password)
    end
end