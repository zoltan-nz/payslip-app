class PayslipsController < ApplicationController

  before_action :set_form_params
  before_action :set_params,        only: [:show_multiple]

  add_crumb('Payslips') {|instance| instance.send :payslips_path }

  def index
    @tax_range_empty ||= TaxRange.all.empty?
    flash.now[:error] = 'Please run rake db:seed to setup Tax Range model. Payslip generator cannot work without valid tax ranges.'if @tax_range_empty
  end

  def show_multiple
    respond_to do |format|
      if payslip_collection
        format.js { render 'show_multiple'}
        format.csv
      else
        flash[:error] = @errors.full_messages
        format.js { render 'show_multiple_error' }
      end
    end
  end

  private

  def payslip_collection
     @payslips = []; @errors = ''
     @employees.each do |employee|
       payslip = Payslip.new(employee: employee, pay_period_start_date: @pay_period_start_date, pay_period_end_date: @pay_period_end_date )
       if payslip.errors.any?
         @errors = payslip.errors
       else
         @payslips << payslip
       end
     end
     @errors.empty?
  end

  def set_form_params
    @employees_for_select ||= Employee.all
  end

  def set_params
    @employees  = Employee.find(payslip_params[:employee_id])     if payslip_params[:employee_id]
    @pay_period_start_date = payslip_params[:payslip_start_date]  if payslip_params[:payslip_start_date]
    @pay_period_end_date   = payslip_params[:payslip_end_date]    if payslip_params[:payslip_end_date]
    @params_for_csv = {employee_id: @employees.map(&:id), payslip_end_date: @pay_period_end_date, payslip_start_date: @pay_period_start_date}
  end

end