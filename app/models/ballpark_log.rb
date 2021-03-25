class BallparkLog < ApplicationRecord
  validates :game_id, presence: true
  validates :stadium_id, presence: true
  validates :result, presence: true

  belongs_to :user
  has_many :likes
  has_one_attached :image
  belongs_to :stadium
  belongs_to :game
  has_many :comments, dependent: :destroy

  TITLE_LENGTH_PER_CARD = 28
  TITLE_LENGTH_PER_LOG = 36
  TITLE_LENGTH_PER_LIKES = 30

  def count_likes
    likes.size
  end

  def count_comments
    comments.size
  end

  def index_title
    title.truncate(TITLE_LENGTH_PER_CARD)
  end

  def user_show_title
    title.truncate(TITLE_LENGTH_PER_LOG)
  end

  def likes_title
    title.truncate(TITLE_LENGTH_PER_LIKES)
  end
end
