class CreateDtests < ActiveRecord::Migration
  def change
    create_table :dtests do |t|
      t.text :test_name
      t.integer :count_test, default: 20
      t.integer :time_exec, default: 20
      t.text :test_descr

      t.timestamps
    end
    add_index :dtests, :test_name
    
  end
end
