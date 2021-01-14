class Team < ApplicationRecord
    has_many :ballpark_logs
    has_one :favorite_team
    
end
