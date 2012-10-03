class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :type_id
      t.string :description

      t.timestamps
    end
  end
end
