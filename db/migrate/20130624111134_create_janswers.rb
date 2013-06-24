class CreateJanswers < ActiveRecord::Migration
  def change
    create_table :janswers do |t|
      t.integer :jquestion_id
      t.integer :danswer_id
      t.boolean :truanswer, default: false

      t.timestamps
    end
  end
end
