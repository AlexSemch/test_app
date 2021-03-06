# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  first_name    :string(255)
#  name          :string(255)
#  second_name   :string(255)
#  birth_date    :date
#  class_st      :integer
#  is_teacher    :boolean          default(FALSE)
#  count_of_test :integer
#  round_ball    :float
#  descr_st      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :birth_date, :class_st, :descr_st, :first_name, :name, :second_name, :user_id#, :round_ball, :count_of_test
  belongs_to :user, :class_name => "user", :foreign_key => "user_id"
  has_many :jtests
  validates :first_name, :name, :second_name, presence: true
  #validates :class, format: 1..12
  default_scope order: 'students.round_ball DESC, students.count_of_test DESC'

  KLAS = [5,6,7,8,9,10,11]

  def has_user?(student)
    !(student.user_id).nil?
  end


  #def top_student(n)
  #  where("round_ball is not null
  #  order by round_ball DESC, count_of_test DESC
  #  limit :M", N: n)
  #end



end

