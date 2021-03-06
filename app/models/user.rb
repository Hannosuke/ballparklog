# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  VALID_PASSWORD_REGEX = /\A\w+\z/.freeze
  validates :password, length: { minimum: 8 }, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :email, uniqueness: true, presence: true

  has_one_attached :image

  has_many :ballpark_logs
  has_many :likes
  has_many :like_ballpark_logs, through: :likes, source: :ballpark_log
  has_one :favorite_team
  has_many :comments

  delegate :favteam, to: :favorite_team

  accepts_nested_attributes_for :favorite_team

  def count_game
    ballpark_logs.size
  end

  def count_win
    ballpark_logs.where(result: "win").size
  end

  def count_lose
    ballpark_logs.where(result: "lose").size
  end

  def count_draw
    ballpark_logs.where(result: "draw").size
  end

  def winning_percentage
    all_games = ballpark_logs.all.size - ballpark_logs.where(result: "draw").size
    format("%.3f", count_win / all_games.to_f)
  end
end
