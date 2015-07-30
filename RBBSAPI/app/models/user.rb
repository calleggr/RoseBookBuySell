class User < ActiveRecord::Base

	has_many :listings, :foreign_key => 'user_id'

  attr_encrypted :password, :key => 'RBBS'

  attr_accessible :username, :password, :email

  validates :username, :presence => true
  validates :password, :presence => true
  validates :email, :presence => true
  
end