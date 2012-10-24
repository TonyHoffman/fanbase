class AddBranchesCountToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :branches_count, :integer, :null => false, :default => 0
    
    Player.reset_column_information
    Player.select(:id).find_each do |p|
      Player.reset_counters p.id, :branches
    end

  end
end
