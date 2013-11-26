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

  subject(:emp) {FactoryGirl.create(:employee)}

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:annual_salary) }
  it { should validate_numericality_of(:annual_salary) }
  it { should validate_presence_of(:super_rate)}
  it { should validate_numericality_of(:super_rate) }


  describe Employee, "#full_name" do
    subject { create(:employee) }

    its(:full_name) { should eq "Tisza, Niki" }
  end

end
