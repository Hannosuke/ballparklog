# frozen_string_literal: true

FactoryBot.define do
  factory :favorite_team do
    user
    team
  end
end
