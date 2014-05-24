require 'spec_helper'
require 'integration_test'

describe "Scopes" do
  login_new_user(:super_admin)

  describe "GET /organizations/{organization_id}/scopes" do
    it "list scopes" do
      get organization_scopes_path(organization)
      response.status.should be(200)
    end
  end
end
