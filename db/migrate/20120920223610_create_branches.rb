class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.integer :contest_id
      t.integer :type_id
      t.integer :player_id
      t.boolean :master
      t.integer :order
      t.boolean :is_player
      t.boolean :is_type
      t.integer :event_id

      t.timestamps
    end
  end
end
