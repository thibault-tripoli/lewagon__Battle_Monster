class CreateAttacks < ActiveRecord::Migration[7.0]
  def change
    create_table :attacks do |t|
      t.integer :damage
      t.string :name
      t.references :specie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
