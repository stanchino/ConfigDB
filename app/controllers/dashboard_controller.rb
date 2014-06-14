class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to organization_categories_url(current_user.organizations.first)
  end
end
