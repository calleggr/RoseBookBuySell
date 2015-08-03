class OfferController < ApplicationController

	def create
		if !User.exists?(params[:offer][:user_id]) || !Listing.exists?(params[:offer][:listing_id])
			render :json => "User or Listing does not exist".to_json
			return
		end
		@offer = Offer.new(params[:offer])
    if @offer.save
    	UserMailer.send_offer(@offer).deliver
    	render :json => @offer.as_json(include: :listing)
    else
    	render :json => 'failed to save offer'.to_json
    end
	end

end