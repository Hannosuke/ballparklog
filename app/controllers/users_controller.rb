class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:edit,:update]}
  before_action :forbid_login_user,{only:[:new,:create]}
  before_action :ensure_correct_user,{only:[:edit,:update]}

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
    if @user.update(update_user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to(user_path)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  



  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, favorite_team_attributes: [:team_id])
  end
  
  def update_user_params
    params.require(:user).permit(:name, :email, :image, favorite_team_attributes: [:team_id, :_destroy, :id])
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
