class AddUserIdBallparklogs < ActiveRecord::Migration[6.0]
  def change
    execute 'DELETE FROM ballpark_logs;'
    add_reference :ballpark_logs, :user, nul: false
  end
end
