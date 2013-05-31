class Dquestion < ActiveRecord::Base
  attr_accessible :count_answer,  :question_text
  validates :question_text, :dtest_id, :count_answer, presence: true
  belongs_to :dtest
end
