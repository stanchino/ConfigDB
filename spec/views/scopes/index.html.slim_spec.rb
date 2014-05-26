require 'spec_helper'

describe "scopes/index" do
  before(:each) do
    @scopes = assign(:scopes, [
      stub_model(Scope, FactoryGirl.attributes_for(:scope)),
      stub_model(Scope, FactoryGirl.attributes_for(:scope)),
    ])
    @organization = assign(:organization, stub_model(Organization, name: "Org", scopes: @scopes))
  end

  it "renders a list of scopes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @scopes.first.name
    assert_select "tr>td", :text => @scopes.first.textkey
    assert_select "tr>td", :text => @scopes.last.name
    assert_select "tr>td", :text => @scopes.last.textkey
  end
end
