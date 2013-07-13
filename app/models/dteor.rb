class Dteor < ActiveRecord::Base
  attr_accessible :dthem_id, :name, :teor_text
  belongs_to :dthem
end
