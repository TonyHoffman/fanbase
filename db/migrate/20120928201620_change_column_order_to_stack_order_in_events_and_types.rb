class ChangeColumnOrderToStackOrderInEventsAndTypes < ActiveRecord::Migration
  def change
    rename_column :events, :order, :stack_order
    rename_column :types, :order, :stack_order
  end
end
