class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    has_many :ballpark_logs
end
