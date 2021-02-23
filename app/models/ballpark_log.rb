class BallparkLog < ApplicationRecord
    validates :game_id, presence: true
    validates :stadium_id, presence: true
    validates :result, presence: true

    belongs_to :user
    has_many :likes
    has_one_attached :image
    belongs_to :stadium
    belongs_to :game 
    has_many :comments

    def count_likes
        likes.size
    end

    def count_comments
        comments.size
    end
end
