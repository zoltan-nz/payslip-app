class PayslipCalculator

  include ActiveModel::Model
  attr_accessor :annual_salary, :super_rate, :pay_period_start_date, :pay_period_end_date, :annual_tax
  attr_reader :start_date, :end_date, :incomplete_month

  def initialize(attributes={})
    super
    @start_date       = @pay_period_start_date.to_date
    @end_date         = @pay_period_end_date.to_date
    @incomplete_month = incomplete_month_calculation
  end

  def gross_income
    ((@annual_salary.to_f / 12) * @incomplete_month).round(0).to_i
  end

  def income_tax
    (((@annual_tax.to_f / 12) * @incomplete_month).round(0)).to_i
  end

  def net_income
    (self.gross_income - self.income_tax).to_i
  end

  def super_amount
    (self.gross_income * @super_rate).round(0).to_i
  end

  private

  def incomplete_month_calculation
    if first_date_of_month? && last_date_of_month?
      1
    else
      fraction_part_of_month
    end
  end

  def first_date_of_month?
    @start_date == @start_date.at_beginning_of_month
  end

  def last_date_of_month?
    @end_date == @end_date.at_end_of_month
  end

  def fraction_part_of_month
    work_days_in_this_month = @start_date.at_beginning_of_month.business_days_until(@start_date.at_end_of_month)
    worked_days = @start_date.business_days_until(@end_date)
    worked_days.to_f / work_days_in_this_month.to_f
  end
end

