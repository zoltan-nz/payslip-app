# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    first_name            'Simon'
    last_name             'Baker'
    annual_salary         110050
    super_rate            0.15
    payment_start_date    15/07/2012
  end
end