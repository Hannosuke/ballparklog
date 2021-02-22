class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    has_one_attached :image

    has_many :ballpark_logs
    has_many :likes
    has_many :like_ballpark_logs, through: :likes, source: :ballpark_log
    has_one :favorite_team
    
    delegate :favteam, to: :favorite_team

    accepts_nested_attributes_for :favorite_team


    def count_game
        ballpark_logs.size
    end

    def count_win
        ballpark_logs.where(result: "win").size
    end

    def count_lose
        ballpark_logs.where(result: "lose").size
    end

    def count_draw
        ballpark_logs.where(result: "draw").size
    end

    def winning_percentage
        all_games = (ballpark_logs.all.size) - (ballpark_logs.where(result: "draw").size)
        sprintf("%.3f", count_win / all_games.to_f)
    end
end
