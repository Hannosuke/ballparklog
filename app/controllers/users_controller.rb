class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_favorite_team
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/")
    else
      render(new_user_path)
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "ユーザー情報を更新しました"
    redirect_to(user_path)
  end

  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, favorite_team_attributes: [:team_id])
  end
  
end
