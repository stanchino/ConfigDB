require 'spec_helper'

describe "scopes/edit" do
  before(:each) do
    @scope = assign(:scope, stub_model(Scope,
      :organization => nil
    ))
    @organization = assign(:organization, stub_model(Organization, scopes: [@scope]))
  end

  it "renders the edit scope form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_scope_path(@organization, @scope), "post" do
    end
  end
end
