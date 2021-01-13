class BallparkLog < ApplicationRecord
    validates :title, presence: true

    belongs_to :user
    has_many :likes
    has_one_attached :image

    def count_likes
        likes.count
    end
end
