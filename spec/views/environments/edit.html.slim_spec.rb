require 'spec_helper'

describe "environments/edit" do
  before(:each) do
    @environment = assign(:environment, stub_model(Environment,
      :name => "MyString",
      :textkey => "MyString"
    ))
    @organization = assign(:organization, stub_model(Organization, environments: [@environment]))
  end

  it "renders the edit environment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_environment_path(@organization, @environment), "post" do
      assert_select "input#environment_name[name=?]", "environment[name]"
      assert_select "input#environment_textkey[name=?]", "environment[textkey]"
    end
  end
end
