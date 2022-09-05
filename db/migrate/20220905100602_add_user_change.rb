class AddUserChange < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :lived
    add_column :users, :lived, :datetime
  end
end
