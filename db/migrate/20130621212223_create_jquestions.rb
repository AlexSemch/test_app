class CreateJquestions < ActiveRecord::Migration
  def change
    create_table :jquestions do |t|
      t.integer :jtest_id
      t.integer :dquestion_id
      t.boolean :truanswer, default: false

      t.timestamps
    end
  end
end
