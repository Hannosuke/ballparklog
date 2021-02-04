class AddInitialColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :initial, :string
  end
end
