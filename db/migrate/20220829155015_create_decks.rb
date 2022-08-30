class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :monster, null: false, foreign_key: true
      t.references :battle, null: false, foreign_key: true
      t.references :attack, null: false, foreign_key: true
      t.integer :hp

      t.timestamps
    end
  end
end
