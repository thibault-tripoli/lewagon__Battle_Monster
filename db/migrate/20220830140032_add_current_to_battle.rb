class AddCurrentToBattle < ActiveRecord::Migration[7.0]
  def change
    add_reference :battles, :current_deck, foreign_key: { to_table: :decks }
  end
end
