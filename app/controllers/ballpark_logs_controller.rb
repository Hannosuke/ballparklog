class BallparkLogsController < ApplicationController

  def index
    @ballpark_logs = BallparkLog.all
  end

  def show
    @ballpark_log = BallparkLog.find(params[:id])
  end

  def new
    @ballpark_log = BallparkLog.new
  end

  def create
    @ballpark_log = current_user.ballpark_logs.new(ballpark_log_params)
    if @ballpark_log&.save
      flash[:notice] = "「#{@ballpark_log.title}」を投稿しました"
      redirect_to("/")
    else
      render :new
    end
  end

  def edit
    @ballpark_log = BallparkLog.find(params[:id])
  end

  def update
    @ballpark_log = BallparkLog.find(params[:id])
    if @ballpark_log.update(update_ballpark_log_params)
      flash[:notice] = "「#{@ballpark_log.title}」を更新しました"
      redirect_to(user_path(current_user.id))
    else
      render :edit
    end
  end

  def destroy
    @ballpark_log = BallparkLog.find(params[:id])
    @ballpark_log.destroy
    flash[:notice] = "削除しました"
    redirect_to("/")
  end

  private

    # Only allow a list of trusted parameters through.
    def ballpark_log_params
      params.require(:ballpark_log).permit(:title, :description, :image, :stadium_id, :game_id, :result)
    end

    def update_ballpark_log_params
      params.require(:ballpark_log).permit(:title, :description, :image, :stadium_id, :game_id, :result)
    end
end
