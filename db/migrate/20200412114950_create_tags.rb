class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tag, null: false, index: true, unique: true
    end
  end
end
