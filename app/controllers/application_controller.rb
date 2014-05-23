class ApplicationController < ActionController::Base
  check_authorization unless: :should_check_authorization?

  protect_from_forgery with: :null_session
  layout :layout_by_resource

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # DEVISE OVERRIDES
  def layout_by_resource
    if devise_controller?
      'landing'
    else
      "application"
    end
  end

  def should_check_authorization?
    respond_to? :devise_controller? || :dashboard_controller?
  end

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, { organization_attributes: [:name] }) }
  end
end
