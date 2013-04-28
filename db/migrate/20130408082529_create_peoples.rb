class CreatePeoples < ActiveRecord::Migration
  def change
    create_table :peoples do |t|
      t.string :pip
      t.date :birth_date
      t.string :classchol
      t.boolean :is_teacher, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :peoples, :user_id, unique: true
    add_index :peoples, [:pip, :birth_date]
  end
end
