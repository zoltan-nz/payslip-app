require 'spec_helper'

describe PayslipCalculator do

  let!(:annual_salary1) {16000}
  let!(:annual_salary2) {37001}
  let!(:annual_salary3) {60050}
  let!(:annual_tax1)    {0}
  let!(:annual_tax2)    {3572.325}
  let!(:annual_tax3)    {11063.25}
  let!(:date1)          {'01-10-2013'}
  let!(:date2)          {'31-10-2013'}
  let!(:date3)          {'10-08-2013'}
  let!(:date4)          {'25-08-2013'}
  let!(:super1)         {0.02}
  let!(:super2)         {0.09}

  let!(:calc1)          {PayslipCalculator.new(annual_salary: annual_salary1, annual_tax: annual_tax1, super_rate: super1, pay_period_start_date: date1, pay_period_end_date: date2)}
  let!(:calc2)          {PayslipCalculator.new(annual_salary: annual_salary2, annual_tax: annual_tax2, super_rate: super2, pay_period_start_date: date1, pay_period_end_date: date2)}
  let!(:calc3)          {PayslipCalculator.new(annual_salary: annual_salary3, annual_tax: annual_tax3, super_rate: super2, pay_period_start_date: date3, pay_period_end_date: date4)}

  let!(:month_fract)    {10.to_f/22}


  describe '.initialize' do
    it 'convert string to date' do
      expect(calc1.start_date).to eq date1.to_date
      expect(calc1.end_date).to eq date2.to_date
    end

    it 'calculate fractional for incomplete month' do
      expect(calc3.incomplete_month).to eq month_fract
    end
  end

  describe '.gross_income' do
    it 'calculate monthly gross income from annual salary' do
      expect(calc1.gross_income).to eq 1333
    end

    it 'multiply with incomplete month' do
      expect(calc3.gross_income).to eq ((annual_salary3.to_f/12)*month_fract).to_i+1
    end

    it 'round up and down properly' do
      expect(calc3.gross_income).to eq ((annual_salary3.to_f/12)*month_fract).round(0).to_i
    end
  end

  describe '.income_tax' do
    it 'calculate monthly tax from annual tax' do
      expect(calc2.income_tax).to eq 298
    end

    it 'multiply with incomplete month' do
      expect(calc3.income_tax).to eq ((annual_tax3/12)*month_fract).to_i
    end

    it 'round up and down properly' do
      expect(calc2.income_tax).to eq 297.69374999999997.round(0)
    end
  end

  describe '.net_income' do
    it 'calculate monthly gross income minus income tax' do
      expect(calc1.net_income).to eq 1333
      expect(calc2.net_income).to eq 2785
    end
  end

  describe '.super_amount' do
    it 'calculate monthly super and round' do
      expect(calc1.super_amount).to eq 27 #26.66
      expect(calc2.super_amount).to eq 277 #277.46999999
    end
  end

end