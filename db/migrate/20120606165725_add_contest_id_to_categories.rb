class AddContestIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :contest_id, :integer

  end
end
