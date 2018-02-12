class EmployeesController < ApplicationController
    
    
  before_action :find_employee, only: [:edit, :show, :update]

  def index
    if !logged_in?
      redirect_to login_path
    else
      @user = User.find(current_user.id)
      @punch = Punch.new
    end
  end


  def show
    @punch = Punch.new
  end 

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.creator = current_user
    if @employee.save
      flash[:notice] = "Account for #{@employee.last_name} has been added"
      redirect_to employee_path(@employee)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "#{@employee.last_name}, #{@employee.first_name} #{@employee.middle_initial} has been updated"
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :middle_initial, :last_name, :government_entity, :position, :employee_phone, :employee_id_number,
    :supervisor_name, :supervisor_phone, :human_resource_manager, :human_resource_phone, :creator_name)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

    

end
