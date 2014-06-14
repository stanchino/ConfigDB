require 'spec_helper'

describe DashboardController do
  describe 'GET index' do
    let(:account) { FactoryGirl.create(:super_admin_account) }
    let(:user) { account.users.first }
    let(:organization) { account.organizations.first }

    before do
      expect(subject).to receive(:authenticate_user!) { true }
      expect(subject).to receive(:current_user) { user }
    end

    it 'render dashboard' do
      get :index
      response.should redirect_to(organization_categories_url(organization))
    end
  end

  describe 'rescue_from' do
    before do
      expect(subject).to receive(:authenticate_user!) { raise CanCan::AccessDenied }
      expect(subject).to receive(:unauthenticated_root_url) { '/' }
    end
    it "rescues from CanCan::AccessDenied" do
      get :index
      response.should redirect_to('/')
      expect(flash[:alert]).not_to be_nil
    end
  end
end
