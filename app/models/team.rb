class Team < ApplicationRecord
    has_many :ballpark_logs
    has_many :favorite_team
    
end
