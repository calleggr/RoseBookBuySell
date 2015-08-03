class Listing < ActiveRecord::Base

	belongs_to :user, :class_name => 'User'
	has_one :book, :foreign_key => 'listing_id'
	has_many :offers, :foreign_key => 'listing_id'

	attr_accessible :user_id, :price, :updated_at

  validates :user_id, :presence => true
  validates :price, :presence => true

end