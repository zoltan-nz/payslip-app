class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  add_crumb('Employees') {|instance| instance.send :employees_path }

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params[:employee].permit(:first_name, :last_name, :annual_salary, :super_rate, :payment_start_date)
    end
end
