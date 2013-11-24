# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  start_date  = "01-01-2013".to_time
  end_date    = Time.now
  random_date = Time.at((end_date.to_f - start_date.to_f)*rand + start_date.to_f).to_date
  Employee.create!(first_name: Forgery(:name).first_name, last_name: Forgery(:name).last_name, annual_salary: Forgery(:monetary).money(min: 20000, max: 150000), super_rate: rand(), payment_start_date: random_date)
end