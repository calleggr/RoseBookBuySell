class Listing < ActiveRecord::Base

	attr_accessible :user_id, :price, :updated_at

  validates :user_id, :presence => true
  validates :price, :presence => true

end