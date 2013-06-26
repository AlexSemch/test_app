# == Schema Information
#
# Table name: jquestions
#
#  id           :integer          not null, primary key
#  jtest_id     :integer
#  dquestion_id :integer
#  truanswer    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Jquestion < ActiveRecord::Base
  attr_accessible :dquestion_id, :jtest_id
  belongs_to :jtest, :class_name => "Jtest", :foreign_key => "jtest_id"
  has_many :janswers
  self.per_page = 1
end
