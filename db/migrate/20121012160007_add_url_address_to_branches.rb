class AddUrlAddressToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :url_address, :string

  end
end
