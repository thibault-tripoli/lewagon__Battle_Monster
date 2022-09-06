class RemoveAttack < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :decks, :attack1_id
    remove_foreign_key :decks, :attack2_id
    remove_foreign_key :decks, :attack3_id
  end
end
