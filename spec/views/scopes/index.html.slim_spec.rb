require 'spec_helper'

describe "scopes/index" do
  before(:each) do
    @scopes = assign(:scopes, [
      stub_model(Scope,
        :organization => nil
      ),
      stub_model(Scope,
        :organization => nil
      )
    ])
    @organization = assign(:organization, stub_model(Organization, name: "Org", scopes: @scopes))
  end

  it "renders a list of scopes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @organization.name, :count => 2
  end
end
