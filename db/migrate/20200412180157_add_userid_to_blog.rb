class AddUseridToBlog < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :user, foreign_key: false, index: true
  end
end
