require 'spec_helper'

describe TaxRange do

  let!(:range1) {TaxRange.create!(income_min: 0,       income_max: 18200,  rate: 0     , tax_from_lower_range: 0)     }
  let!(:range2) {TaxRange.create!(income_min: 18201,   income_max: 37000,  rate: 0.19  , tax_from_lower_range: 0)     }
  let!(:range3) {TaxRange.create!(income_min: 37001,   income_max: 80000,  rate: 0.325 , tax_from_lower_range: 3572)  }
  let!(:range4) {TaxRange.create!(income_min: 80001,   income_max: 180000, rate: 0.37  , tax_from_lower_range: 17547) }
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
