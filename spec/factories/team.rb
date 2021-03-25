# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { "テストチーム" }
    first_name { "テスト" }
    initial { "テ" }
    last_name { "チーム" }
  end
end
