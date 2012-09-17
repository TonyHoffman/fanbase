class RemoveColumn < ActiveRecord::Migration
  def up
    remove_column :categories, :contest_id
  end

  def down
  end
end
