class AddUserIdToTacs < ActiveRecord::Migration[5.1]
  def change
    add_column :tacs, :user_id, :integer
    add_index :tacs, :user_id
  end
end
