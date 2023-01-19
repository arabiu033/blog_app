class ChangeForeignKeyForLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :owner_id
  end
end
