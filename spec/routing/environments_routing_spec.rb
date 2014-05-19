require "spec_helper"

describe EnvironmentsController do
  let(:organization) { stub_model(Organization) }
  describe "routing" do

    it "routes to #index" do
      get("/organizations/#{organization.to_param}/environments").should route_to("environments#index", :organization_id => organization.to_param)
    end

    it "routes to #new" do
      get("/organizations/#{organization.to_param}/environments/new").should route_to("environments#new", :organization_id => organization.to_param)
    end

    it "routes to #show" do
      get("/organizations/#{organization.to_param}/environments/1").should route_to("environments#show", :organization_id => organization.to_param, :id => "1")
    end

    it "routes to #edit" do
      get("/organizations/#{organization.to_param}/environments/1/edit").should route_to("environments#edit", :organization_id => organization.to_param, :id => "1")
    end

    it "routes to #create" do
      post("/organizations/#{organization.to_param}/environments").should route_to("environments#create", :organization_id => organization.to_param)
    end

    it "routes to #update" do
      put("/organizations/#{organization.to_param}/environments/1").should route_to("environments#update", :organization_id => organization.to_param, :id => "1")
    end

    it "routes to #destroy" do
      delete("/organizations/#{organization.to_param}/environments/1").should route_to("environments#destroy", :organization_id => organization.to_param, :id => "1")
    end

  end
end
