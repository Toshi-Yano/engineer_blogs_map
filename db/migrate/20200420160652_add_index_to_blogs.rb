class AddIndexToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_index :blogs, :title
    add_index :blogs, :body, length:200 
  end
end
