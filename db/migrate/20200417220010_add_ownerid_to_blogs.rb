class AddOwneridToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :owner_id, :integer
  end
end
