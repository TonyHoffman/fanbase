class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :last_name
      t.string :first_name
      t.integer :first_game
      t.integer :last_game
      t.string :position

      t.timestamps
    end
  end
end
