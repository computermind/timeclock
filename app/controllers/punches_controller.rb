class PunchesController < ApplicationController
    
  before_action :get_employee

  def punch_in
    #time_since_last_punch = Time.now.getutc - last_punch

    @punch = Punch.create(employee: @employee)
    @punch.origin_ip = request.ip
    if @punch.save
      flash[:notice] = "You have punched in"
      redirect_to employee_path(@employee)  
    else
        render 'employees/index'
    end
  end

  def punch_out
    punch = @employee.current_punch_in

    if @employee.current_punch_in && punch.update(punch_out: Time.now)
      flash[:notice] = "You have punched out"
      redirect_to employee_path(@employee)  
    else
        flash[:error] = "You are not punched in, so you can't punch out."
        redirect_to employee_path(@employee)
    end
  end

  private

  def get_employee
    @employee = Employee.find(params[:id])
  end
    
end
