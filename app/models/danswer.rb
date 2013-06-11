# == Schema Information
#
# Table name: danswers
#
#  id           :integer          not null, primary key
#  dquestion_id :integer
#  answer_text  :text
#  ans_is_true  :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Danswer < ActiveRecord::Base
  attr_accessible :ans_is_true, :answer_text

  belongs_to :dquestion, :class_name => "Dquestion", :foreign_key => "dquestion_id"

  validates :answer_text, presence: true
end
