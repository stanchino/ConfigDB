require 'spec_helper'

describe "environments/new" do
  before(:each) do
    assign(:environment, stub_model(Environment,
      :organization => nil,
      :name => "MyString",
      :textkey => "MyString"
    ).as_new_record)
    @organization = assign(:organization, stub_model(Organization, environments: []))
  end

  it "renders new environment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_environments_path(@organization), "post" do
      assert_select "input#environment_name[name=?]", "environment[name]"
      assert_select "input#environment_textkey[name=?]", "environment[textkey]"
    end
  end
end
