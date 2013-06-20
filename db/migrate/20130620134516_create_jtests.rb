class CreateJtests < ActiveRecord::Migration
  def change
    create_table :jtests do |t|
      t.integer :dtest_id
      t.integer :student_id
      t.time :begin_time
      t.time :end_time
      t.float :ball

      t.timestamps
    end
    add_index :jtests, :student_id
  end
end
