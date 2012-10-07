class ChangeBranchIdNamesToPrevHolders < ActiveRecord::Migration
  def change
    rename_column :branches, :prev_02, :prev_01  
    rename_column :branches, :prev_03, :prev_02   
    rename_column :branches, :branch_id_four, :prev_03
  end
end
