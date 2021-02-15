class AddLastNameColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :last_name, :string
  end
end
