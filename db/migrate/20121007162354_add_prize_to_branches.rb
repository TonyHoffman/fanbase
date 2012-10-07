class AddPrizeToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :prize, :string

  end
end
