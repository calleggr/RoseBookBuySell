class Offer < ActiveRecord::Base

	belongs_to :user, :class_name => 'User'
	has_one :listing, :foreign_key => 'listing_id'

	attr_accessible :user_id, :listing_id, :price, :updated_at

  validates :user_id, :presence => true
  validates :listing_id, :presence => true
  validates :price, :presence => true

end