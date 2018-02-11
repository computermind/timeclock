class UsersController < ApplicationController
    
  attr_accessor :email, :name, :password, :password_confirmation
  #has_secure_password
 
#  def show
#    @user = User.find(:first, :conditions => ["lower(username) = ?", params[:id].downcase])
#  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username , :password_digest, :password, :employee_id, :status, :job_id))
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account has been created."
      redirect_to root_path
    else
      render :new
    end
  end
    
end
