class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :round_id
      t.integer :card_id
      t.string :player_guess
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
