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

  #find specific offer
  def find_id
    if Offer.exists?(params[:id])
      @offer = Offer.find(params[:id])
      render :json => @offer.as_json(include: :listing)
    else
      render :json => "offer not found".to_json
    end
  end

  #find all offers for a given user
  def find_user_id
    @offers = Offer.where("user_id = ?",params[:user_id]).all
    if !@offers.empty?
      ret = []
      @offers.each do |offer|
        ret << offer.as_json(include: :listing)
      end
      render :json => ret
    else
      render :json => "user has no offers".to_json
    end
  end

  def respond_to_offer
    if Offer.exists?(params[:id])
      @offer = Offer.find(params[:id])
      @email = params[:body]
      UserMailer.respond_to_offer(@offer, @email).deliver
      render :json => "email sent".to_json
    else
      render :json => "offer not found".to_json
    end
  end

end