# frozen_string_literal: true

class FavoriteTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team

  def favteam
    team.name
  end
end
