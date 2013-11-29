FactoryGirl.define do
  factory :tax_range, class: TaxRange do
    income_min                0
    income_max                18200
    rate                      0.0
    tax_from_lower_range      0
  end

  factory :tax_range2, class: TaxRange do
    income_min                18201
    income_max                37000
    rate                      0.19
    tax_from_lower_range      0
  end

  factory :tax_range3, class: TaxRange do
    income_min                37001
    income_max                80000
    rate                      0.325
    tax_from_lower_range      3572
  end

  factory :tax_range4, class: TaxRange do
    income_min                80001
    income_max                180000
    rate                      0.37
    tax_from_lower_range      17547
  end
end