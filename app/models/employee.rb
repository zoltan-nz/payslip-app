# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  annual_salary :integer
#  super_rate    :decimal(4, 2)
#  created_at    :datetime
#  updated_at    :datetime
#

class Employee < ActiveRecord::Base

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :annual_salary, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :super_rate,    presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0}

  before_validation :convert_from_percent_to_decimal

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end

  def self.import(file)
    everything_was_right = true
    CSV.foreach(file.path, headers: true) do |row|
      Employee.create! row.to_hash
    end rescue everything_was_right = false
    everything_was_right
  end

  private

  def convert_from_percent_to_decimal
    self.super_rate = self.super_rate.to_f/100 if percentage?
  end

  def percentage?
    (self.super_rate.to_s.include?('%')) or (self.super_rate.to_f > 1.0)
  end

end
