require "spec_helper"

describe EmployeesController do
  describe "routing" do

    it "routes to #index" do
      get("/employees").should route_to("employees#index")
    end

    it "routes to #new" do
      get("/employees/new").should route_to("employees#new")
    end

    it "routes to #show" do
      get("/employees/1").should route_to("employees#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employees/1/edit").should route_to("employees#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employees").should route_to("employees#create")
    end

    it "routes to #update" do
      put("/employees/1").should route_to("employees#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employees/1").should route_to("employees#destroy", :id => "1")
    end

  end
end
