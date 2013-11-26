# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    first_name            'Simon'
    last_name             'Baker'
    annual_salary         '110050'
    super_rate            '15%'
  end
end
