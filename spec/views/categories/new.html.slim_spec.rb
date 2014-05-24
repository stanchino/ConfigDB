require 'spec_helper'

describe "categories/new" do
  before(:each) do
    assign(:category, stub_model(Category).as_new_record)
    @organization = assign(:organization, stub_model(Organization, categories: []))
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_categories_path(@organization), "post" do
    end
  end
end
