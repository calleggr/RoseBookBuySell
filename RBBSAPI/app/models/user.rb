class User < ActiveRecord::Base

attr_accessible :username, :password, :email

  validates :username, :presence => true
  validates :password, :presence => true
  validates :email, :presence => true
  
end