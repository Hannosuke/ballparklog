class AddColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :first_name, :string
  end
end
