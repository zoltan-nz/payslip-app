class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  add_crumb('Employees') {|instance| instance.send :employees_path }
  add_crumb('New Employee', only: ['new', 'create']) {|instance| instance.send :new_employee_path }
  add_crumb('Edit Employee', only: ['edit']) {|instance| instance.send :edit_employee_path }

  def index
    @employees = Employee.order(:id)
  end

  def new
    @employee = Employee.new
  end

  def import
    if Employee.import(import_params)
      flash[:notice] = 'Employees are imported without problem.'
    else
      flash[:error] = 'Import was not perfect. Please check your csv file.'
    end
    redirect_to employees_url
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
      else
        flash.now[:error] = @employee.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
      else
        flash.now[:error] = @employee.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      flash[:error] = "Employee was deleted from the database."
      format.html { redirect_to employees_url }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params[:employee].permit(:first_name, :last_name, :annual_salary, :super_rate)
    end

    def import_params
      params[:file]
    end
end
