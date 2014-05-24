require 'spec_helper'

describe "categories/edit" do
  before(:each) do
    @category = assign(:category, stub_model(Category))
    @organization = assign(:organization, stub_model(Organization, categories: [@category]))
  end

  it "renders the edit category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_category_path(@organization, @category), "post" do
    end
  end
end
