# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :visitor_team, class_name: "Team"
  belongs_to :home_team, class_name: "Team"
  has_many :ballpark_logs
end
