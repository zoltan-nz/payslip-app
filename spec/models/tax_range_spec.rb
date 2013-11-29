# == Schema Information
#
# Table name: tax_ranges
#
#  id                   :integer          not null, primary key
#  income_min           :integer
#  income_max           :integer
#  rate                 :decimal(, )
#  tax_from_lower_range :integer
#  created_at           :datetime
#  updated_at           :datetime
#

require 'spec_helper'

describe TaxRange do

  let!(:range1) {FactoryGirl.create(:tax_range)}
  let!(:range2) {FactoryGirl.create(:tax_range2)     }
  let!(:range3) {FactoryGirl.create(:tax_range3)  }
  let!(:range4) {FactoryGirl.create(:tax_range4) }
  let!(:annual_salary1) {16000}
  let!(:annual_salary2) {37001}
  let!(:annual_salary3) {60050}
  let!(:negative_annual_salary) {-1}

  describe '#valid_tax_range(annual_salary)' do
    it 'return valid tax range' do
      expect(TaxRange.valid_tax_range(annual_salary1)).to eq range1
      expect(TaxRange.valid_tax_range(annual_salary2)).to eq range3
    end

    it 'respond with nil for negative values' do
      expect(TaxRange.valid_tax_range(negative_annual_salary)).to eq nil
    end
  end

  describe '#annual_tax(annual_salary)' do
    it 'calculate annual tax' do
      expect(TaxRange.annual_tax(annual_salary1)).to eq 0
      expect(TaxRange.annual_tax(annual_salary2)).to eq 3572.325
      expect(TaxRange.annual_tax(annual_salary3)).to eq 11063.25
    end

    it 'nil when parameter 0 or negative' do
      expect(TaxRange.annual_tax(0)).to eq nil
      expect(TaxRange.annual_tax(negative_annual_salary)).to eq nil
    end
  end

end
