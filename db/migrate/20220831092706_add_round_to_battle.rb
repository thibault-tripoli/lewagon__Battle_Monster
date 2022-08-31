class AddRoundToBattle < ActiveRecord::Migration[7.0]
  def change
    add_column :battles, :round, :integer, default: 0
  end
end
