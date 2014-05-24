require 'spec_helper'

describe "scopes/new" do
  before(:each) do
    assign(:scope, stub_model(Scope,
      :organization => nil
    ).as_new_record)
    @organization = assign(:organization, stub_model(Organization, scopes: []))
  end

  it "renders new scope form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_scopes_path(@organization), "post" do
    end
  end
end
