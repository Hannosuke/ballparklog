class AddColumnToBallparklog < ActiveRecord::Migration[6.0]
  def change
    add_column :ballpark_logs, :result, :string
  end
end
