class UserController < ApplicationController
	#CRU no D because deleting a user is not needed

	def create
    @user = User.new(params[:user])
    if @user.save
      render :json => @user.to_json
    else
      redner :json => 'save failed'.to_json
    end
	end


	def read
    @user = User.new
	end


	def update

	end

end
