shared_examples "nested organization routing" do |resource_name|
  let(:organization) { stub_model(Organization) }
  describe "routing" do
    it "routes to #index" do
      get("/organizations/#{organization.to_param}/#{resource_name}").should route_to("#{resource_name}#index", :organization_id => organization.to_param)
    end

    it "routes to #new" do
      get("/organizations/#{organization.to_param}/#{resource_name}/new").should route_to("#{resource_name}#new", :organization_id => organization.to_param)
    end

    it "routes to #show" do
      get("/organizations/#{organization.to_param}/#{resource_name}/1").should route_to("#{resource_name}#show", :organization_id => organization.to_param, :id => "1")
    end

    it "routes to #edit" do
      get("/organizations/#{organization.to_param}/#{resource_name}/1/edit").should route_to("#{resource_name}#edit", :organization_id => organization.to_param, :id => "1")
    end

    it "routes to #create" do
      post("/organizations/#{organization.to_param}/#{resource_name}").should route_to("#{resource_name}#create", :organization_id => organization.to_param)
    end

    it "routes to #update" do
      put("/organizations/#{organization.to_param}/#{resource_name}/1").should route_to("#{resource_name}#update", :organization_id => organization.to_param, :id => "1")
    end

    it "routes to #destroy" do
      delete("/organizations/#{organization.to_param}/#{resource_name}/1").should route_to("#{resource_name}#destroy", :organization_id => organization.to_param, :id => "1")
    end

  end
end
