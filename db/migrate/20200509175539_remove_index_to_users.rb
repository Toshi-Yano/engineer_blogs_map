class RemoveIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :myblog
  end
end
