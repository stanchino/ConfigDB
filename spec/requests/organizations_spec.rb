require 'spec_helper'
require 'integration_test'

describe "Organizations" do
  login_new_user(:super_admin)

  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get organizations_path
      response.status.should be(200)
    end
  end
end
