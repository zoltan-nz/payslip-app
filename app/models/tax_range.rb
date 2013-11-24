class TaxRange < ActiveRecord::Base

  #scopes
  scope :valid_tax_range, lambda {|annual_salary| TaxRange.where('income_min <= ? AND ? <= income_max', annual_salary, annual_salary).first}

  #methods
  def self.annual_tax(annual_salary)
    vtr = self.valid_tax_range(annual_salary)
    vtr.tax_from_lower_range + ((annual_salary - vtr.income_min)*vtr.rate)
  end

end
