class RemoveMyblogToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :myblog
    remove_column :users, :blog_id
  end
end
