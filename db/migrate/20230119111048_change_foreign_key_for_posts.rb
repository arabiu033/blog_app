class ChangeForeignKeyForPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :owner_id
  end
end
