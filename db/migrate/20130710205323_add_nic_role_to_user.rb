class AddNicRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :rol, :string, default: :student
  end
end
