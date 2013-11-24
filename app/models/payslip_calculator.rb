class PayslipCalculator

  include ActiveModel::Model
  attr_accessor :annual_salary, :super_rate, :pay_period_start_date, :pay_period_end_date, :annual_tax

  def initialize(attributes={})
    super
    @pay_period_start_date = @pay_period_start_date.to_date
    @pay_period_end_date = @pay_period_end_date.to_date
    @incomplete_month = incomplete_month_calculation
  end

  def gross_income
    ((@annual_salary / 12) * @incomplete_month).round(0)
  end

  def income_tax
    (((@annual_tax / 12) * @incomplete_month).round(0)).to_i
  end

  def net_income
    (self.gross_income - self.income_tax).to_i
  end

  def super
    (self.gross_income * @super_rate).round(0)
  end

  private

  def incomplete_month_calculation
    if first_date_of_month? and last_date_of_month?
      1
    else
      fraction_part_of_month
    end
  end

  def first_date_of_month?
    @pay_period_start_date == @pay_period_start_date.at_beginning_of_month
  end

  def last_date_of_month?
    @pay_period_end_date == @pay_period_end_date.at_end_of_month
  end

  def fraction_part_of_month
    work_days_in_this_month = @pay_period_start_date.at_beginning_of_month.business_days_until(@pay_period_start_date.at_end_of_month)
    worked_days = @pay_period_start_date.business_days_until(@pay_period_end_date)
    worked_days / work_days_in_this_month
  end
end

