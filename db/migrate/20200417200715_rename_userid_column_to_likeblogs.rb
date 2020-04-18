class RenameUseridColumnToLikeblogs < ActiveRecord::Migration[5.2]
  def change
    rename_column :like_blogs, :user_id, :like_user_id
  end
end
