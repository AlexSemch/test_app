# == Schema Information
#
# Table name: janswers
#
#  id           :integer          not null, primary key
#  jquestion_id :integer
#  danswer_id   :integer
#  truanswer    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Janswer < ActiveRecord::Base
  attr_accessible :danswer_id, :jquestion_id, :truanswer
  belongs_to :jquestion, :class_name => "Jquestion", :foreign_key => "jquestion_id"
end
