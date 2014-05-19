require 'spec_helper'

describe "environments/index" do
  before(:each) do
    @environments = assign(:environments, [
      stub_model(Environment,
        :organization => nil,
        :name => "Name",
        :textkey => "Textkey"
      ),
      stub_model(Environment,
        :organization => nil,
        :name => "Name",
        :textkey => "Textkey"
      )
    ])
    @organization = assign(:organization, stub_model(Organization, name: "Org", environments: @environments))
  end

  it "renders a list of environments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @organization.name, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Textkey".to_s, :count => 2
  end
end
