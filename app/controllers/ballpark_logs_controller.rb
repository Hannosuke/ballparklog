class BallparkLogsController < ApplicationController
  before_action :set_ballpark_log, only: [:show, :edit, :update, :destroy]

  # GET /ballpark_logs
  # GET /ballpark_logs.json
  def index
    @ballpark_logs = BallparkLog.all
  end

  # GET /ballpark_logs/1
  # GET /ballpark_logs/1.json
  def show
  end

  # GET /ballpark_logs/new
  def new
    @ballpark_log = BallparkLog.new
  end

  # GET /ballpark_logs/1/edit
  def edit
  end

  # POST /ballpark_logs
  # POST /ballpark_logs.json
  def create
    @ballpark_log = BallparkLog.new(ballpark_log_params)

    respond_to do |format|
      if @ballpark_log.save
        format.html { redirect_to @ballpark_log, notice: 'Ballpark log was successfully created.' }
        format.json { render :show, status: :created, location: @ballpark_log }
      else
        format.html { render :new }
        format.json { render json: @ballpark_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ballpark_logs/1
  # PATCH/PUT /ballpark_logs/1.json
  def update
    respond_to do |format|
      if @ballpark_log.update(ballpark_log_params)
        format.html { redirect_to @ballpark_log, notice: 'Ballpark log was successfully updated.' }
        format.json { render :show, status: :ok, location: @ballpark_log }
      else
        format.html { render :edit }
        format.json { render json: @ballpark_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballpark_logs/1
  # DELETE /ballpark_logs/1.json
  def destroy
    @ballpark_log.destroy
    respond_to do |format|
      format.html { redirect_to ballpark_logs_url, notice: 'Ballpark log was successfully destroyed.' }
      format.json { head :no_content }
    end
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
