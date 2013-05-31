class Dtest < ActiveRecord::Base
  attr_accessible :count_test, :test_descr, :test_name, :time_exec
  has_many :dquestions
  validates :test_name, :time_exec, :count_test, presence: true
end
