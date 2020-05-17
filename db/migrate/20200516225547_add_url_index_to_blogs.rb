class AddUrlIndexToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_index :blogs, :url
  end
end
