FactoryBot.define do
    factory :game do
        association :visitor_team_id, factory: :team
        association :home_team_id, factory: :team
        date {"2020-06-19"}
        visitor_score {1}
        home_score {1}
    end
end