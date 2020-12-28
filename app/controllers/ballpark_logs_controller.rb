class BallparkLogsController < ApplicationController
  before_action :set_ballpark_log, only: [:show, :edit, :update, :destroy]

  def index
    @ballpark_logs = BallparkLog.all
  end

  def show
  end

  def new
    @ballpark_log = BallparkLog.new
  end

  def create
    @ballpark_log = BallparkLog.new(ballpark_log_params)
    if @ballpark_log.save
      flash[:notice] = "投稿しました"
      redirect_to("/")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ballpark_log.update(ballpark_log_params)
    flash[:notice] = "内容を更新しました"
    render("/")
  end

  def destroy
    @ballpark_log.destroy
    flash[:notice] = "削除しました"
    redirect_to("/")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballpark_log
      @ballpark_log = BallparkLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ballpark_log_params
      params.require(:ballpark_log).permit(:title, :description)
    end
end
