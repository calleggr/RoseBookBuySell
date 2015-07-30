class UserController < ApplicationController
	#CR no UD because we dont have those features in our app
  
	def create
    temp = User.where("email = ? or username = ?", params[:user][:email], params[:user][:username]).first
    if temp
      render :json => 'a user with that email or username already exists'.to_json
    else
      @user = User.new(params[:user])
      if @user.save
        render :json => @user.to_json
      else
        redner :json => 'save failed'.to_json
      end
    end
	end


	def find_id
    @user = User.find(params[:id])
    if @user
      render :json => @user.to_json
    else
      render :json => "user not found".to_json
    end
	end

  def find_email
    @user = User.where("email = ?", params[:email]).first
    if @user
      render :json => @user.to_json
    else
      render :json => "user not found".to_json
    end
  end

  def find_username
    @user = User.where("username = ?", params[:username]).first
    if @user
      render :json => @user.to_json
    else
      render :json => "user not found".to_json
    end
  end

end
