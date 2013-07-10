class CreateDthems < ActiveRecord::Migration
  def change
    create_table :dthems do |t|
      t.integer :class_st
      t.text :them_text

      t.timestamps
    end
    add_index :dthems, :them_text
  end
end
