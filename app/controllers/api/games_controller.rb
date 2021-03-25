class Api::GamesController < ApplicationController
  def index
    @games = Game.where(date: "%#{params[:date]}%")
    render json: @games.map { |game|
                   { id: game.id, game_name: "#{game.home_team.name} vs #{game.visitor_team.name}" }
                 }
  end
end
