class AddStadiumToBaseballlog < ActiveRecord::Migration[6.0]
  def change
    add_reference :ballpark_logs, :stadium, foreign_key: true
    add_reference :ballpark_logs, :team, foreign_key: true
  end
end
