class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category, null: false, index: true, unique: true
    end
  end
end
