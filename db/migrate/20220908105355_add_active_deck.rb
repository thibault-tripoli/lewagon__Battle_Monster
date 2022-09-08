class AddActiveDeck < ActiveRecord::Migration[7.0]
  def change
    add_column :decks, :active_at, :datetime
  end
end
