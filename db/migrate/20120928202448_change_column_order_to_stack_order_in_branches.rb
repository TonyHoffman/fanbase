class ChangeColumnOrderToStackOrderInBranches < ActiveRecord::Migration
  def change
    rename_column :branches, :order, :stack_order
  end
end
