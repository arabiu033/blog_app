class ChangeForeignKeyForComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :owner_id
  end
end
