# frozen_string_literal: true

class Stadium < ApplicationRecord
  has_many :ballpark_logs
end
