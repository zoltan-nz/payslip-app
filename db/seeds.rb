# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.delete_all
10.times do
  employee = Employee.new(first_name: Forgery(:name).first_name, last_name: Forgery(:name).last_name, annual_salary: Forgery(:monetary).money(min: 50000, max: 150000).to_i, super_rate: "#{rand(1..20)}%")
  employee.save
end

TaxRange.delete_all
TaxRange.create!(income_min: 0,       income_max: 18200,  rate: 0.0   , tax_from_lower_range: 0)
TaxRange.create!(income_min: 18201,   income_max: 37000,  rate: 0.19  , tax_from_lower_range: 0)
TaxRange.create!(income_min: 37001,   income_max: 80000,  rate: 0.325 , tax_from_lower_range: 3572)
TaxRange.create!(income_min: 80001,   income_max: 180000, rate: 0.37  , tax_from_lower_range: 17547)
TaxRange.create!(income_min: 180000,  income_max: 2147483646, rate: 0.45  , tax_from_lower_range: 54547)


