require 'spec_helper'

describe DashboardController do
  describe 'GET index' do
    before { expect(subject).to receive(:authenticate_user!) { true } }
    it 'render dashboard' do
      get :index
      response.should be_success
    end
  end

  describe 'rescue_from' do
    before do
      expect(subject).to receive(:authenticate_user!) { raise CanCan::AccessDenied }
      expect(subject).to receive(:root_url) { '/' }
    end
    it "rescues from CanCan::AccessDenied" do
      get :index
      response.should redirect_to('/')
      expect(flash[:alert]).not_to be_nil
    end
  end
end
