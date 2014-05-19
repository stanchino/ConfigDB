require 'spec_helper'

describe "environments/show" do
  before(:each) do
    @environment = assign(:environment, stub_model(Environment,
      :organization => nil,
      :name => "Name",
      :textkey => "Textkey"
    ))
    @organization = assign(:organization, stub_model(Organization, environments: [@environment]))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/#{@organization.name}/)
    rendered.should match(/Name/)
    rendered.should match(/Textkey/)
  end
end
