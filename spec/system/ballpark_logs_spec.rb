require 'rails_helper'

describe '投稿機能', type: :system do
    describe '一覧表示機能' do
        before do
            team_a = FactoryBot.create(:team, name: 'テストテストチームA')
            team_b = FactoryBot.create(:team, name: 'テストテストチームB')
            game_a = FactoryBot.create(:game, visitor_team_id: team_a.id, home_team_id: team_b.id)
            stadium_a = FactoryBot.create(:stadium)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            favorite_team_a = FactoryBot.create(:favorite_team, user: user_a, team: team_a) 
            FactoryBot.create(:ballpark_log, title: 'テスト観戦', user: user_a, stadium: stadium_a, game: game_a)
        end

        context 'ユーザーAがログインしている時' do
            before do
                visit login_path
                fill_in 'メールアドレス', with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログイン'
            end
        end
        
        it 'ユーザーAが作成したタスクが表示される' do
            visit '/'
            expect(page).to have_content 'テスト観戦'
        end
    end
end