# == Schema Information
#
# Table name: jtests
#
#  id         :integer          not null, primary key
#  dtest_id   :integer
#  student_id :integer
#  begin_time :time
#  end_time   :time
#  ball       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Jtest < ActiveRecord::Base
  attr_accessible :ball, :begin_time, :dtest_id, :end_time, :student_id
  belongs_to :dtest, :class_name => "Dtest", :foreign_key => "dtest_id"
  belongs_to :student, :class_name => "Student", :foreign_key => "student_id"
  has_many :jquestions
end
