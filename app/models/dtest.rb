# == Schema Information
#
# Table name: dtests
#
#  id         :integer          not null, primary key
#  test_name  :text
#  count_test :integer          default(20)
#  time_exec  :integer          default(20)
#  test_descr :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dtest < ActiveRecord::Base
  attr_accessible :count_test, :test_descr, :test_name, :time_exec
  has_many :dquestions
  has_many :jtests

  validates :test_name, :time_exec, :count_test, presence: true
end
