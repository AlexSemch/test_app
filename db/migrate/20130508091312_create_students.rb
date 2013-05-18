class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :first_name
      t.string :name
      t.string :second_name
      t.date :birth_date
      t.integer :class_st
      t.boolean :is_teacher, default: false
      t.integer :count_of_test
      t.float :round_ball
      t.text :descr_st

      t.timestamps
    end
    add_index :students, :first_name
    add_index :students, :name
    add_index :students, :second_name
    add_index :students, :user_id
    add_index :students, :round_ball
  end
end
