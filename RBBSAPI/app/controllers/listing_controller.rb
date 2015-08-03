class ListingController < ApplicationController


  #create a listing with a book
  def create
    if !User.exists?(params[:listing][:user_id])
      render :json => 'user not found'.to_json
    else
      @listing = Listing.new(params[:listing])
      if @listing.save
        @book = Book.new(params[:book])
        @book.listing_id = @listing.id
        if @book.save
          render :json => @listing.as_json(include: :book)
        else
          render :json => 'failed to save book'.to_json
        end
      else
        render :json => 'failed to save listing'.to_json
      end
    end
  end

  #find by listing's id
  def find_id
    if Listing.exists?(params[:id])
      @listing = Listing.find(params[:id])
      render :json => @listing.as_json(include: :book)
    else
      render :json => "listing not found".to_json
    end
  end

  #get all listings for a user
  def find_user_id
    @listings = Listing.where("user_id = ?",params[:user_id]).all
    if !@listings.empty?
      ret = []
      @listings.each do |listing|
        ret << listing.as_json(include: :book)
      end
      render :json => ret
    else
      render :json => "user has no listings".to_json
    end
  end

  def find_all
    @listings = Listing.all
    if !@listings.empty?
      ret = []
      @listings.each do |listing|
        ret << listing.as_json(include: :book)
      end
      render :json => ret
    else
      render :json => "user has no listings".to_json
    end
  end

  def update
    if Listing.exists?(params[:listing][:id]) && Book.exists?(params[:book][:id])
      @listing = Listing.find(params[:listing][:id])
      @book = Book.find(params[:book][:id])
      if @listing.update_attributes(params[:listing]) && @book.update_attributes(params[:book])
        render :json => @listing.as_json(include: :book)
      else
        render :json => "update failed".to_json
      end
    else
      render :json => "book or listing not found".to_json
    end
  end


end