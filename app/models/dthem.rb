class Dthem < ActiveRecord::Base
  attr_accessible :class_st, :them_text
  has_many :dtests
end
