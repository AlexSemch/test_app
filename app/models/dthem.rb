# == Schema Information
#
# Table name: dthems
#
#  id         :integer          not null, primary key
#  class_st   :integer
#  them_text  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dthem < ActiveRecord::Base
  attr_accessible :class_st, :them_text
  has_many :dtests, dependent: :destroy
  has_many :dteors, dependent: :destroy
end
