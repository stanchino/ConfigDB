module ApplicationHelper
  def root_url
    if current_user
      authenticated_root_url
    else
      unauthenticated_root_url
    end
  end
end
