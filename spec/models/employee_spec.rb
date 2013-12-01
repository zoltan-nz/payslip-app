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

require 'spec_helper'

describe Employee do

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:annual_salary) }
  it { should validate_numericality_of(:annual_salary) }
  it { should validate_presence_of(:super_rate)}
  it { should validate_numericality_of(:super_rate) }

  subject(:emp) {FactoryGirl.create(:employee)}
  its(:full_name) {should eq "Baker, Simon" }

  describe 'super rate can except % or decimal or number without percentage' do
    let(:emp_integer) {FactoryGirl.create(:employee, super_rate: 50)}
    let(:emp_percentage) {FactoryGirl.create(:employee, super_rate: '30%')}
    let(:emp_decimal) {FactoryGirl.create(:employee, super_rate: 0.04)}

    it 'converts integer to decimal' do
      expect(emp_integer.super_rate).to eq 0.50
    end

    it 'converts percentage to decimal' do
      expect(emp_percentage.super_rate).to eq 0.30
    end

    it 'stays intact decimal' do
      expect(emp_decimal.super_rate).to eq 0.04
    end
  end

  describe '#import' do

    it 'should import valid csv content' do
      file = File.open('./db/employees.csv')
      expect(Employee.import(file)).to eq true
      @employees = Employee.all
      expect(@employees[0].first_name).to eq 'Theresa'
      expect(@employees[1].last_name).to eq 'Richardson'
    end

  end

end
