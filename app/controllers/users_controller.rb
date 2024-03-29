class UsersController < ApplicationController
  attr_accessor :email, :name, :password, :password_confirmation
  
  def new
    @user = User.new
  end
  

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your user account has been created."
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
