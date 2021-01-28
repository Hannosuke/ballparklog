class AddGamesToBallparklog < ActiveRecord::Migration[6.0]
  def change
    add_reference :ballpark_logs, :game, foreign_key: true
  end
end