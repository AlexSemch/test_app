# == Schema Information
#
# Table name: dteors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  teor_text  :text
#  dthem_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dteor < ActiveRecord::Base
  attr_accessible :dthem_id, :name, :teor_text
  belongs_to :dthem
end
