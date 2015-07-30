class Book < ActiveRecord::Base

	belongs_to :listing, :class_name => 'Listing'

	attr_accessible :listing_id, :title, :edition, :course_number, :department

	validates :listing_id, :presence => true

end