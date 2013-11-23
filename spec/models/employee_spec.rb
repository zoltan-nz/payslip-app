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

require 'spec_helper'

describe Employee do

  # relationships

  # validation


  #it { should belong_to(:tenant) }
  #it { should have_many(:businesses) }
  #it { should validate_uniqueness_of(:name) }
  #it { should validate_presence_of(:name) }
  #
  #it { should validate_presence_of(:default_number_of_tax_authorities) }
  #it { should_not allow_value(-0.01).for(:default_number_of_tax_authorities) }
  #it { should allow_value(0).for(:default_number_of_tax_authorities) }
  #it { should_not allow_value(0.1).for(:default_number_of_tax_authorities) }
  #it { should allow_value(1).for(:default_number_of_tax_authorities) }
  #it { should validate_numericality_of(:default_number_of_tax_authorities) }
  #
  #it { should validate_presence_of(:sort_order) }
  #it { should_not allow_value(-0.01).for(:sort_order) }
  #it { should allow_value(0).for(:sort_order) }
  #it { should_not allow_value(0.1).for(:sort_order) }
  #it { should allow_value(1).for(:sort_order) }
  #it { should validate_numericality_of(:sort_order) }
end
