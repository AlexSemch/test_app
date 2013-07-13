class CreateDteors < ActiveRecord::Migration
  def change
    create_table :dteors do |t|
      t.string :name
      t.text :teor_text
      t.integer :dthem_id

      t.timestamps
    end
  end
end
