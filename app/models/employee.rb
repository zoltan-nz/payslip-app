# == Schema Information
#
# Table name: employees
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  annual_salary      :integer
#  super_rate         :decimal(, )
#  payment_start_date :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Employee < ActiveRecord::Base

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end

end
