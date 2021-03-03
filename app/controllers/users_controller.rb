class UsersController < ApplicationController
  before_action :authenticate_user, only:[:edit,:update]
  before_action :forbid_login_user, only:[:new,:create]
  before_action :ensure_correct_user, only:[:edit,:update]
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
    @user.build_favorite_team
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/")
    else
      render(new_user_path)
    end
  end

  def edit
  end
  
  def update
    if @user.update(update_user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to(user_path)
    else
      render :edit
    end
  end

  def show
    @ballpark_logs = BallparkLog.where(user_id: @user.id).includes(:game).order("games.date DESC").page(params[:page])
  end


  



  private

  def set_user
    @user = User.find(params[:id])
  end

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
