class BallparkLog < ApplicationRecord
    validates :title, presence: true

    belongs_to :user
    has_many :likes
    has_one_attached :image
    has_one :stadium
    has_many :teams

    def count_likes
        likes.size
    end
end
