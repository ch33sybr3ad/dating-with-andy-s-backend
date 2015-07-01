class User < ActiveRecord::Base
  has_many :user_interests
  has_many :interests, through: :user_interests

  validates_presence_of :username, :email, :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_length_of :password, minimum: 6
  validates_uniqueness_of :username, :email
end
