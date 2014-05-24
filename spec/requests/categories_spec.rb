require 'spec_helper'
require 'integration_test'

describe "Categories" do
  login_new_user(:super_admin)

  describe "GET /organizations/{organization_id}/categories" do
    it "list categories" do
      get organization_categories_path(organization)
      response.status.should be(200)
    end
  end
end
