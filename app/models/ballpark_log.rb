class BallparkLog < ApplicationRecord
    validates :title, presence: true
    validates :stadium_id, presence: true

    belongs_to :user
    has_many :likes
    has_one_attached :image
    belongs_to :stadium
    belongs_to :game

    def count_likes
        likes.size
    end
end
