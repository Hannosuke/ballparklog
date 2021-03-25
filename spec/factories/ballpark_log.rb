FactoryBot.define do
  factory :ballpark_log do
    title { "テストタイトル" }
    description { "テストメモです。テストテストテスト" }
    result { "win" }
    game
    stadium
    user
  end
end
