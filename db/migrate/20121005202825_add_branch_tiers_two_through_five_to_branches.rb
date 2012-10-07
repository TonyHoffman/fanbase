class AddBranchTiersTwoThroughFiveToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :branch_id, :integer

    add_column :branches, :prev_02, :integer

    add_column :branches, :prev_03, :integer

    add_column :branches, :branch_id_four, :integer

    add_column :branches, :branch_id_five, :integer

  end
end
