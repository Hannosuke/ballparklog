class Team < ApplicationRecord
    has_many :ballpark_logs
    has_many :favorite_teams
    has_many :games
    
end
