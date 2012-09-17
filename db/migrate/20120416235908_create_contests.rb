class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :first_game
      t.integer :last_game
      t.datetime :start
      t.datetime :end
      t.integer :team_id

      t.timestamps
    end
  end
end
