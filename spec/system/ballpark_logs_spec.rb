require 'rails_helper'

describe '投稿管理機能', type: :system do
    let(:user_a) {user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
    let(:user_b) {user_b = FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')}
    describe '一覧表示機能' do
        before do
            team_a = FactoryBot.create(:team, name: 'テストテストチームA')
            team_b = FactoryBot.create(:team, name: 'テストテストチームB')
            game_a = FactoryBot.create(:game, visitor_team_id: team_a.id, home_team_id: team_b.id)
            stadium_a = FactoryBot.create(:stadium)
            favorite_team_a = FactoryBot.create(:favorite_team, user: user_a, team: team_a) 
            favorite_team_b = FactoryBot.create(:favorite_team, user: user_b, team: team_a) 
            FactoryBot.create(:ballpark_log, title: 'テスト観戦', user: user_a, stadium: stadium_a, game: game_a)

            visit login_path
            fill_in 'メールアドレス', with: 'a@example.com'
            fill_in 'パスワード', with: 'password'
            click_button 'ログイン'
        end

        shared_examples_for 'ユーザーAが作成した投稿が表示される' do
            it { expect(page).to have_content 'テスト観戦' }
        end

        context '投稿一覧ページにいる時' do
            before do
                visit '/'
            end
            it_behaves_like 'ユーザーAが作成した投稿が表示される'
        end
        
        context 'ユーザーAの詳細ページにいるとき' do
            before do
                visit user_path(user_a)                
            end
            it_behaves_like 'ユーザーAが作成した投稿が表示される'
        end
        
        context 'ユーザーBの詳細ページにいるとき' do
            it 'ユーザーAが作成した投稿が表示されない' do
                visit user_path(user_b)
                expect(page).to have_no_content 'テスト観戦'
            end
        end
    end
end