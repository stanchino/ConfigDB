require 'spec_helper'

describe "scopes/show" do
  before(:each) do
    @scope = assign(:scope, FactoryGirl.create(:scope))
    @organization = assign(:organization, stub_model(Organization, name: "Org", scopes: [@scope]))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Org/)
  end
end
