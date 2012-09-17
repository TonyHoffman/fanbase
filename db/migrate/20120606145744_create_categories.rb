class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :level1
      t.string :level2
      t.string :level3
      t.string :level4

      t.timestamps
    end
  end
end
