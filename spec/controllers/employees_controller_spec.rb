require 'spec_helper'

describe EmployeesController do

  let!(:employee) {FactoryGirl.create(:employee)}
  let(:valid_attributes) {FactoryGirl.attributes_for(:employee)}
  let(:update_attributes) {FactoryGirl.attributes_for(:employee)}

  describe "GET index" do
    it "assigns all employees as @employees" do
      get :index, {}
      assigns(:employees).should eq([employee])
    end
  end

  describe "GET new" do
    it "assigns a new employee as @employee" do
      get :new, {}
      assigns(:employee).should be_a_new(Employee)
    end
  end

  describe "GET edit" do
    it "assigns the requested employee as @employee" do
      get :edit, {:id => employee.to_param}
      assigns(:employee).should eq(employee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, {employee: valid_attributes}
        }.to change(Employee, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, {employee: valid_attributes}
        assigns(:employee).should be_a(Employee)
        assigns(:employee).should be_persisted
      end

      it "redirects to the created employee" do
        post :create, {employee: valid_attributes}
        response.should redirect_to(employees_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employee as @employee" do
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {employee: {  }}
        assigns(:employee).should be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => {  }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested employee" do
        employee = Employee.create! valid_attributes
        # Assuming there are no other employees in the database, this
        # specifies that the Employee created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Employee.any_instance.should_receive(:update).with({'first_name' => 'Joe' })
        put :update, {:id => employee.to_param, :employee => {'first_name' => 'Joe'}}
      end

      it "assigns the requested employee as @employee" do
        put :update, {:id => employee.to_param, :employee => valid_attributes}
        assigns(:employee).should eq(employee)
      end

      it "redirects to the index page" do
        put :update, {:id => employee.to_param, :employee => valid_attributes}
        response.should redirect_to(employees_path)
      end
    end

    describe "with invalid params" do
      it "assigns the employee as @employee" do
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => {  }}
        assigns(:employee).should eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = Employee.create! valid_attributes
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => {  }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      expect {
        delete :destroy, {:id => employee.to_param}
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      delete :destroy, {:id => employee.to_param}
      response.should redirect_to(employees_url)
    end
  end

end
