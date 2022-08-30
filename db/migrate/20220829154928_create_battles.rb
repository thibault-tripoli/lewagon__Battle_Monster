class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.integer :pc_win
      t.integer :xp_win
      t.string :status
      t.references :winner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
