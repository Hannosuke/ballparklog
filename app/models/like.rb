class Like < ApplicationRecord
    validates :user_id, presence: true
    validates :ballpark_log_id, presence: true
end
