class RenameSeaonToSeasonInSports < ActiveRecord::Migration
  def up
    rename_column 'sports', 'seaon', 'season'
  end

  def down
    rename_column 'sports', 'seaon', 'season'
  end
end
