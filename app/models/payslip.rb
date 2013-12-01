class Payslip

  include ActiveModel::Model
  attr_accessor :employee, :pay_period_start_date, :pay_period_end_date
  attr_reader :calculation


  def initialize(attributes={})
    super
    @calculation = PayslipCalculator.new(
        annual_salary: @employee.annual_salary,
        super_rate: @employee.super_rate,
        pay_period_start_date: @pay_period_start_date,
        pay_period_end_date: @pay_period_end_date,
        annual_tax: TaxRange.annual_tax(@employee.annual_salary)
    ) if self.valid?
  end

  validates :employee, :pay_period_start_date, :pay_period_end_date, presence: true
  validate :dates_are_in_the_same_month?


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

  def super_amount
    @calculation.super_amount
  end

  private

  def dates_are_in_the_same_month?
    if @pay_period_start_date.to_date.month == @pay_period_end_date.to_date.month
      true
    else
      errors.add(:pay_period_end_date, 'must be in the same month as start date')
      false
    end
  end

end


