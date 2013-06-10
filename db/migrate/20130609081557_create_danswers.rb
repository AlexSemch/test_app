class CreateDanswers < ActiveRecord::Migration
  def change
    create_table :danswers do |t|
      t.integer :dquestion_id
      t.text :answer_text
      t.boolean :ans_is_true, default: false

      t.timestamps
    end
    add_index :danswers, :dquestion_id
  end
end
