require 'spec_helper'

describe "scopes/show" do
  before(:each) do
    @scope = assign(:scope, stub_model(Scope,
      :organization => nil
    ))
    @organization = assign(:organization, stub_model(Organization, name: "Org", scopes: [@scope]))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Org/)
  end
end
