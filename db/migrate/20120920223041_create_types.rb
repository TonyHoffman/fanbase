class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.integer :sport_id
      t.string :event

      t.timestamps
    end
  end
end
