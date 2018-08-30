class EmployeesController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @employee = Employee.new
    @depts = Department.where(company_id: @company.id)
  end

  def create
    @company = Company.find(params[:company_id])
    @employee = Employee.new(employee_params)
    @employee.company_id = @company.id
    @employee.generate_eid
    if @employee.save
      msg = "New Employee created!"
      redirect_to company_path(@employee.company_id)
    else
      render 'new'
    end
  end


  def edit
  end

  def index
  end

  def show
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :department_id)
  end
end
