class AddDescriberColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :describer, :boolean

  end
end
