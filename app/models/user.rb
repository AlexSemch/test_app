# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nik             :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :nik, :email, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_one :student
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationship, :class_name => "Relationship", :foreign_key => "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_relationship, source: :follower

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :nik, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 5},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true


  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
     relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def add_to_student(student)
     user.student = (student)
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


end
