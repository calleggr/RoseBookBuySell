class UserController < ApplicationController
  #CR no UD because we dont have those features in our app

  def create
    temp = User.where("email = ? or username = ?", params[:user][:email], params[:user][:username]).first
    if temp
      render :json => 'a user with that email or username already exists'.to_json
    else
      @user = User.new(params[:user])
      if @user.save
        render :json => @user.as_json(only: [:username, :id, :email])
      else
        render :json => 'save failed'.to_json
      end
    end
  end


  def find_id
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render :json => @user.as_json(only: [:username, :id, :email])
    else
      render :json => "user not found".to_json
    end
  end

  def find_email
    @user = User.where("email = ?", params[:email]).first
    if @user
      render :json => @user.as_json(only: [:username, :id, :email])
    else
      render :json => "user not found".to_json
    end
  end

  def find_username
    @user = User.where("username = ?", params[:username]).first
    if @user
      render :json => @user.as_json(only: [:username, :id, :email])
    else
      render :json => "user not found".to_json
    end
  end

  def login
    @user = User.where("username = ? and password = ?", params[:username], params[:password]).first
    if @user
      render :json => @user.as_json(only: [:username, :id, :email])
    else
      render :json => 'invalid username/password'.to_json
    end
  end

end
