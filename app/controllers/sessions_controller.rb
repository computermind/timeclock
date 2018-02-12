class SessionsController < ApplicationController
  attr_accessor :email, :name, :password, :password_confirmation
  #has_secure_password
  
  def new

  end

  def create
   @user = User.find_by(username: params[:username])
   #@user = User.where("lower(username) = ?", params[:username].downcase!)#.first!
   #@user = User.find_by_id(params[:id]) || @user = User.where(:username=> params[:username]).first!
    if @user  #&& @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You are logged in"
      redirect_to root_path
    else
      flash[:error] = "There was a probelm with your username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out"
    redirect_to root_path
  end
    
end
