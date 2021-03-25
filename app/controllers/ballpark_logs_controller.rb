class BallparkLogsController < ApplicationController
  before_action :authenticate_user, only: %i[new create edit update delete]
  before_action :ensure_correct_user, only: %i[edit update destroy]
  before_action :set_ballpark_log, only: %i[show edit update destroy]

  INDEX_PER_PAGE = 16

  def index
    @ballpark_logs = BallparkLog.includes(:game).order("games.date DESC").page(params[:page]).per(INDEX_PER_PAGE)
  end

  def show
    @comments = @ballpark_log.comments
    @comment = Comment.new
  end

  def new
    @ballpark_log = BallparkLog.new
  end

  def create
    @ballpark_log = current_user.ballpark_logs.new(ballpark_log_params)
    if @ballpark_log&.save
      flash[:notice] = "「#{@ballpark_log.title}」を登録しました"
      redirect_to(user_path(current_user.id))
    else
      render :new
    end
  end

  def edit
    @ballpark_log = BallparkLog.find(params[:id])
  end

  def update
    if @ballpark_log.update(update_ballpark_log_params)
      flash[:notice] = "「#{@ballpark_log.title}」を更新しました"
      redirect_to(ballpark_log_path(@ballpark_log))
    else
      render :edit
    end
  end

  def destroy
    @ballpark_log.destroy
    flash[:notice] = "Logを削除しました"
    redirect_to(user_path(current_user.id))
  end

  private

  def set_ballpark_log
    @ballpark_log = BallparkLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ballpark_log_params
    params.require(:ballpark_log).permit(:title, :description, :image, :stadium_id, :game_id, :result)
  end

  def update_ballpark_log_params
    params.require(:ballpark_log).permit(:title, :description, :image, :stadium_id, :game_id, :result)
  end

  def ensure_correct_user
    @ballpark_log = BallparkLog.find(params[:id])
    redirect_to root_path, alert: "権限がありません" if @ballpark_log.user_id != current_user.id
  end
end
