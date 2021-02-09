class Games::SearchesController < ApplicationController
    def index
        @games = Game.where(date: "%#{params[:date]}%")

        respond_to do |format|
            format.html { redirect_to :root }
            format.json { render json: @games }
        end
    end
end