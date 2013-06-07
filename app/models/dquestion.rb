# == Schema Information
#
# Table name: dquestions
#
#  id            :integer          not null, primary key
#  question_text :text
#  count_answer  :integer          default(4)
#  dtest_id      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dquestion < ActiveRecord::Base
  attr_accessible :count_answer,  :question_text
  validates :question_text, :dtest_id, :count_answer, presence: true
  belongs_to :dtest

  def to_param  # overridden
    id
  end
end
