class PayslipsController < ApplicationController

  before_action :set_form_params,   only: [:index]
  before_action :set_params,        only: [:show_multiple]

  add_crumb('Payslips') {|instance| instance.send :payslips_path }

  def index

  end

  def show_multiple

    @payslips = []

    @employees.each do |employee|
      payslip = Payslip.new(employee: employee, pay_period_start_date: @pay_period_start_date, pay_period_end_date: @pay_period_end_date )
      @payslips << payslip
    end

  end

  private

  def set_form_params
    @employees_for_select ||= Employee.all
  end

  def set_params
    @employees  = Employee.find(payslip_params[:employee_id])     if payslip_params[:employee_id]
    @pay_period_start_date = payslip_params[:payslip_start_date]  if payslip_params[:payslip_start_date]
    @pay_period_end_date   = payslip_params[:payslip_end_date]    if payslip_params[:payslip_end_date]
  end

  def payslip_params
    params[:payslips].permit(:payslip_start_date, :payslip_end_date, :employee_id => [])
  end


end