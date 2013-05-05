# == Schema Information
#
# Table name: peoples
#
#  id         :integer          not null, primary key
#  pip        :string(255)
#  birth_date :date
#  classchol  :string(255)
#  is_teacher :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class People < ActiveRecord::Base
  attr_accessible :birth_date, :classchol, :pip
  belongs_to :user

  before_save { |people| people.pip = pip.split(' ').map{ |elem| elem.capitalize }.join(' ')  }

  validates :pip, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true, uniqueness: true
end
