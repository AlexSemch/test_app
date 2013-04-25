class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :pip
      t.date :birth_date
      t.string :classchol
      t.boolean :is_teacher, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :people, [:user_id, :pip, :birth_date]
  end
end
