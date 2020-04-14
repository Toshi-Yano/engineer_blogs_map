class AddCategoryToBlog < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :category, foreign_key: true, index: true
  end
end
