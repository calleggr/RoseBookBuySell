class Offer < ActiveRecord::Base

	belongs_to :user, :class_name => 'User'
	belongs_to :listing, :class_name => 'Listing'

	attr_accessible :user_id, :listing_id, :price, :updated_at

  validates :user_id, :presence => true
  validates :listing_id, :presence => true
  validates :price, :presence => true

end