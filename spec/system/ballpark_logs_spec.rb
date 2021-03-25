require "rails_helper"

describe "投稿管理機能", type: :system do
  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com") }
  let(:user_b) { FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com") }
  let!(:stadium_a) { FactoryBot.create(:stadium) }
  let!(:team_a) { FactoryBot.create(:team, name: "テストテストチームA") }
  let!(:team_b) { FactoryBot.create(:team, name: "テストテストチームB") }
  let!(:game_a) { FactoryBot.create(:game, date: Date.today, visitor_team_id: team_a.id, home_team_id: team_b.id) }

  before do
    favorite_team_a = FactoryBot.create(:favorite_team, user: user_a, team: team_a)
    favorite_team_b = FactoryBot.create(:favorite_team, user: user_b, team: team_a)
    FactoryBot.create(:ballpark_log, title: "テスト観戦", user: user_a, stadium: stadium_a, game: game_a)

    visit login_path
    fill_in "メールアドレス", with: login_user.email
    fill_in "パスワード", with: login_user.password
    click_button "ログイン"
  end

  describe "一覧表示機能" do
    shared_examples_for "ユーザーAが作成した投稿が表示される" do
      it { expect(page).to have_content "テスト観戦" }
    end

    context "投稿一覧ページにいる時" do
      let(:login_user) { user_a }
      before do
        visit "/"
      end
      it_behaves_like "ユーザーAが作成した投稿が表示される"
    end

    context "ユーザーAの詳細ページにいるとき" do
      let(:login_user) { user_a }
      before do
        visit user_path(user_a)
      end
      it_behaves_like "ユーザーAが作成した投稿が表示される"
    end

    context "ユーザーBの詳細ページにいるとき" do
      let(:login_user) { user_a }
      it "ユーザーAが作成した投稿が表示されない" do
        visit user_path(user_b)
        expect(page).to have_no_content "テスト観戦"
      end
    end
  end

  describe "新規投稿作成機能" do
    let(:login_user) { user_a }

    before do
      visit new_ballpark_log_path
      fill_in "ballpark_log[title]", with: log_title
      fill_in "ballpark_log[description]", with: "メモだよ"
      select "テストスタジアム", from: "ballpark_log[stadium_id]"
      select "WIN", from: "ballpark_log[result]"
      find("#datepicker").click
      find(".ui-state-active").click
      select "テストテストチームB vs テストテストチームA", from: "ballpark_log[game_id]"

      click_button "登録する"
    end

    context "新規作成画面でタイトルを入力した時" do
      let(:log_title) { "試しに観戦に行く" }

      it "正常に登録される" do
        visit "/"
        expect(page).to have_content log_title
      end
    end
  end
end
