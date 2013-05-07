class Micropost < ActiveRecord::Base
  include MicropostsHelper
  attr_accessible :content
  belongs_to :user

  #before_save { |micropost| micropost.content = wrap(content) }
  validates :content, presence: true, length: {maximum: 150}
  validates  :user_id, presence: true

  default_scope order: 'microposts.created_at DESC'
end
