class CreateDquestions < ActiveRecord::Migration
  def change
    create_table :dquestions do |t|
      t.text :question_text
      t.integer :count_answer, default: 4
      t.integer :dtest_id

      t.timestamps
    end
    add_index :dquestions, :dtest_id
  end
end
