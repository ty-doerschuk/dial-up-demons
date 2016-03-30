class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :theme_name
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
