class AddReitingStudentIndex < ActiveRecord::Migration

  def change
    add_index :students, [:count_of_test, :round_ball]
  end

end
