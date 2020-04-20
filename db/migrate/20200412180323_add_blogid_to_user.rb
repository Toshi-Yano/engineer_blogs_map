class AddBlogidToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :blog, foreign_key: false, index: true
  end
end