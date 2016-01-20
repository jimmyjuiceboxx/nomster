class AlterPhotosAddUserIdColumn < ActiveRecord::Migration
  def change
  	add_column :photos, :user_id, :
  end
end
