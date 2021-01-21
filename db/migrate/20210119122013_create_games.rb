class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :visitor_team, null: false, foreign_key: { to_table: :teams }
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.date :date, null: false
      t.integer :score_visitor, null: false
      t.integer :score_home, null: false

      t.timestamps
    end
  end
end
