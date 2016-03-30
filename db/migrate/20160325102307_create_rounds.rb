class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :deck_id
      t.integer :player_id
      t.integer :cards_left

      t.timestamps null: false
    end
  end
end
