class PayslipsController < ApplicationController

  before_action :set_form_params
  before_action :set_params,        only: [:show_multiple, :export_csv]

  add_crumb('Payslips') {|instance| instance.send :payslips_path }

  def index
    @tax_range_empty ||= TaxRange.all.empty?
    flash.now[:error] = 'Please run rake db:seed to setup Tax Range model. Payslip generator cannot work without valid tax ranges.'if @tax_range_empty
  end

  def show_multiple
    respond_to do |format|
      if @paysliplist.errors.empty?
        format.js
      else
        flash[:error] = @paysliplist.errors[:payslip_end_date].first
        format.js { render 'error' }
      end
    end
  end

  def export_csv
    respond_to do |format|
      format.csv { render 'payslips'}
    end
  end

  private

  def set_form_params
    @employees_for_select ||= Employee.all
  end

  def set_params
    @paysliplist = PayslipList.new(payslip_params)
    @payslips = @paysliplist.all
  end

  def payslip_params
    params[:payslips].permit(:payslip_start_date, :payslip_end_date, :employee_ids => [])
  end

end