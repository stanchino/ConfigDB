require 'spec_helper'

describe "Environments" do
  let (:organization) { FactoryGirl.create(:organization) }

  describe "GET /organizations/{organization_id}/environments" do
    it "list environments" do
      get organization_environments_path(organization)
      response.status.should be(200)
    end
  end
end
