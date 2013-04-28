class AddUniqToUserId < ActiveRecord::Migration
  def change
    add_index :peoples, :user_id, unique: true
  end
end
