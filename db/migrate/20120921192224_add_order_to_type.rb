class AddOrderToType < ActiveRecord::Migration
  def change
    add_column :types, :order, :integer

  end
end
