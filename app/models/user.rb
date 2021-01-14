class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    has_many :ballpark_logs
    has_many :likes
    has_many :like_ballpark_logs, through: :likes, source: :ballpark_log
end
