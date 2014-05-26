require 'spec_helper'

describe "environments/index" do
  before(:each) do
    @environments = assign(:environments, [
      stub_model(Environment, FactoryGirl.attributes_for(:environment)),
      stub_model(Environment, FactoryGirl.attributes_for(:environment))
    ])
    @organization = assign(:organization, stub_model(Organization, name: "Org", environments: @environments))
  end

  it "renders a list of environments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @environments.first.name
    assert_select "tr>td", :text => @environments.first.textkey
    assert_select "tr>td", :text => @environments.last.name
    assert_select "tr>td", :text => @environments.last.textkey
  end
end
