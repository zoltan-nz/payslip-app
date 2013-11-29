require "spec_helper"

describe PayslipsController do
  describe "routing" do

    it "routes to #index" do
      get("/payslips").should route_to("payslips#index")
    end

    it 'routes to #show_multiple' do
      post('/payslips/multiple').should route_to('payslips#show_multiple')
    end

  end
end
