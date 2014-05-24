require 'spec_helper'

describe "categories/index" do
  before(:each) do
    @categories = assign(:categories, [
      stub_model(Category),
      stub_model(Category)
    ])
    @organization = assign(:organization, stub_model(Organization, name: "Org", categories: @categories))
  end

  it "renders a list of categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @organization.name, :count => 2
  end
end
