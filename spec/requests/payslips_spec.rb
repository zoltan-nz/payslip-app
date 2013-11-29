require 'spec_helper'

describe "Payslips" do

    let!(:tax_range) {FactoryGirl.create(:tax_range4)}
    let!(:employee1) {FactoryGirl.create(:employee)}
    let!(:employee2) {FactoryGirl.create(:employee)}

    it "should redirect to index at form validation error" do

      get payslips_path
      expect(response).to render_template(:index)

      xhr :post, payslips_multiple_path, payslips: {employee_id: ["1","2"], payslip_start_date: "2013-11-07", payslip_end_date: "2013-12-23"}
      expect(response.body).to include('window.location.replace')

    end

end
