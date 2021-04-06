class AddLikesCountToBallparkLogs < ActiveRecord::Migration[6.0]
  def self.up
    add_column :ballpark_logs, :likes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :ballpark_logs, :likes_count
  end
end
