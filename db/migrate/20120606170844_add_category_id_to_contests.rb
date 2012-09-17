class AddCategoryIdToContests < ActiveRecord::Migration
  def change
    add_column :contests, :category_id, :integer

  end
end
