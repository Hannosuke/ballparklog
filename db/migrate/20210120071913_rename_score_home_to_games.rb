class RenameScoreHomeToGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :score_home, :home_score
    rename_column :games, :score_visitor, :visitor_score
  end
end
