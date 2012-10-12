class AddSponsorNameToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :sponsor, :string

  end
end
