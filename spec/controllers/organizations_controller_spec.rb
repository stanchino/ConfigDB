require 'spec_helper'
require 'faker'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe OrganizationsController do

  let(:user) { FactoryGirl.build(:super_admin) }

  let(:organization) { user.organization }

  before do
    organization
    allow(subject).to receive(:current_user) { user }
  end

  # This should return the minimal set of attributes required to create a valid
  # Organization. As you add validations to Organization, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => Faker::Name.name } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrganizationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all organizations as @organizations" do
      get :index, {}, valid_session
      assigns(:organizations).should eq(Organization.all)
    end
  end

  describe "GET show" do
    it "assigns the requested organization as @organization" do
      get :show, {:id => organization.to_param}, valid_session
      assigns(:organization).should eq(organization)
    end
  end

  describe "GET new" do
    it "assigns a new organization as @organization" do
      get :new, {}, valid_session
      assigns(:organization).should be_a_new(Organization)
    end
  end

  describe "GET edit" do
    it "assigns the requested organization as @organization" do
      get :edit, {:id => organization.to_param}, valid_session
      assigns(:organization).should eq(organization)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Organization" do
        expect {
          post :create, {:organization => valid_attributes}, valid_session
        }.to change(Organization, :count).by(1)
      end

      it "assigns a newly created organization as @organization" do
        post :create, {:organization => valid_attributes}, valid_session
        assigns(:organization).should be_a(Organization)
        assigns(:organization).should be_persisted
      end

      it "redirects to the created organization" do
        post :create, {:organization => valid_attributes}, valid_session
        response.should redirect_to(Organization.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved organization as @organization" do
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        post :create, {:organization => { "name" => "invalid value" }}, valid_session
        assigns(:organization).should be_a_new(Organization)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        post :create, {:organization => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested organization" do
        # Assuming there are no other organizations in the database, this
        # specifies that the Organization created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Organization.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => organization.to_param, :organization => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested organization as @organization" do
        put :update, {:id => organization.to_param, :organization => valid_attributes}, valid_session
        assigns(:organization).should eq(organization)
      end

      it "redirects to the organization" do
        put :update, {:id => organization.to_param, :organization => valid_attributes}, valid_session
        response.should redirect_to(organization)
      end
    end

    describe "with invalid params" do
      it "assigns the organization as @organization" do
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        put :update, {:id => organization.to_param, :organization => { "name" => "invalid value" }}, valid_session
        assigns(:organization).should eq(organization)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        put :update, {:id => organization.to_param, :organization => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested organization" do
      expect {
        delete :destroy, {:id => organization.to_param}, valid_session
      }.to change(Organization, :count).by(-1)
    end

    it "redirects to the organizations list" do
      delete :destroy, {:id => organization.to_param}, valid_session
      response.should redirect_to(organizations_url)
    end
  end
end
