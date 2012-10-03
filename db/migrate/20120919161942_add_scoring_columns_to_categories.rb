class AddScoringColumnsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :category_id, :integer

    add_column :categories, :stage, :integer

    add_column :categories, :exact, :boolean

    add_column :categories, :upto, :integer
    
    add_column :categories, :branch, :string
    
    add_column :categories, :master, :boolean

  end
end
