class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :description
      t.string :season

      t.timestamps
    end
  end
end
