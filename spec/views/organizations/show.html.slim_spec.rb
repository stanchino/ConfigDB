require 'spec_helper'

describe "organizations/show" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
