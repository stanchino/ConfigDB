require 'spec_helper'
require 'integration_test'

describe "Environments" do
  login_new_user(:super_admin)

  describe "GET /organizations/{organization_id}/environments" do
    it "list environments" do
      get organization_environments_path(organization)
      response.status.should be(200)
    end
  end
end
