class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  layout :layout_by_resource

  # DEVISE OVERRIDES
  def layout_by_resource
    if devise_controller?
      'landing'
    else
      "application"
    end
  end
end
