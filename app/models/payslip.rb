class Payslip

  include ActiveModel::Model
  attr_accessor :employee, :pay_period_start_date, :pay_period_end_date

  def initialize(attributes={})
    super
    @calculation = PayslipCalculator.new(
        annual_salary: @employee.annual_salary,
        super_rate: @employee.super_rate,
        pay_period_start_date: @pay_period_start_date,
        pay_period_end_date: @pay_period_end_date,
        annual_tax: TaxRange.annual_tax(@employee.annual_salary)
    )
  end

  def name
    @employee.full_name
  end

  def pay_period
    "#{@pay_period_start_date} - #{@pay_period_end_date}"
  end

  def gross_income
    @calculation.gross_income
  end

  def income_tax
    @calculation.income_tax
  end

  def net_income
    @calculation.net_income
  end

  def super
    @calculation.super_amount
  end

end


